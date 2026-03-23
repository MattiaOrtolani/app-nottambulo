import { DecimalPipe, NgIf } from '@angular/common';
import {
	AfterViewInit,
	Component,
	ElementRef,
	OnDestroy,
	ViewChild,
	computed,
	effect,
	inject,
	signal,
} from '@angular/core';
import * as L from 'leaflet';
import { Locale, LocaleType, NearbyLocale } from '../models/locale.model';
import { LocaleApiService } from '../services/locale-api.service';

type MapFilter = 'ALL' | 'CLUB' | 'BAR' | 'JAZZ' | 'LOUNGE';

const CARTO_DARK_MATTER_URL = 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';

const DEFAULT_POSITION = {
	lat: 45.4642,
	lon: 9.19,
};

const RESULTS_STEP = 10;

@Component({
	selector: 'app-nearby-page',
	standalone: true,
	imports: [NgIf, DecimalPipe],
	styleUrl: './nearby-page.component.scss',
	template: `
		<section class="map-page">
			<aside class="map-sidebar">
				<div class="sidebar-search">
					<input
						type="search"
						placeholder="Cerca locale o zona..."
						[value]="searchTerm()"
						(input)="handleSearchInput($event)"
					/>
				</div>

				<div class="filter-row">
					@for (filter of filters; track filter) {
						<button
							type="button"
							class="filter-chip"
							[class.filter-chip-active]="activeFilter() === filter"
							(click)="setActiveFilter(filter)"
						>
							{{ getFilterLabel(filter) }}
						</button>
					}
				</div>

				<div class="sidebar-divider"></div>

				<p *ngIf="loading()" class="status status-info">Sto caricando la mappa dei locali...</p>
				<p *ngIf="error()" class="status status-error">{{ error() }}</p>

				<div class="sidebar-results">
					<div class="sidebar-list">
						@for (locale of filteredLocales(); track locale.id) {
							<button
								type="button"
								class="locale-row"
								[class.locale-row-active]="activeLocale()?.id === locale.id"
								(click)="selectLocale(locale)"
							>
								<div class="locale-row-head">
									<h2>{{ locale.nome }}</h2>
									<span
										*ngIf="locale.distanzaKm !== null && locale.distanzaKm !== undefined"
										class="locale-distance"
									>
										{{ locale.distanzaKm | number: '1.1-1' }} km
									</span>
								</div>

								<p class="locale-meta">{{ getSidebarMeta(locale) }}</p>
								<p *ngIf="getSidebarCopy(locale)" class="locale-copy">{{ getSidebarCopy(locale) }}</p>
							</button>
						}
					</div>

					<button
						*ngIf="showExtendSearchButton()"
						type="button"
						class="extend-search-button"
						(click)="extendSearch()"
					>
						Estendi ricerca
					</button>
				</div>

				<p *ngIf="!loading() && !error() && filteredLocales().length === 0" class="status status-info">
					Nessun locale vicino disponibile in questo momento.
				</p>
			</aside>

			<section class="map-stage">
				<div class="map-toolbar">
					<button type="button" class="map-tool" (click)="zoomIn()">+</button>
					<button type="button" class="map-tool" (click)="zoomOut()">−</button>
					<button type="button" class="map-tool" (click)="centerOnUser()">⌖</button>
				</div>

				<div class="map-surface">
					<div #mapHost class="osm-map-host" aria-label="Mappa OpenStreetMap con tema dark"></div>

					<article class="map-detail" *ngIf="activeLocale() as locale">
						<div class="map-detail-icon">{{ getTypeBadge(locale.tipo) }}</div>

						<div class="map-detail-copy">
							<h3>{{ locale.nome }}</h3>
							<p>
								{{ getSelectedAddress(locale) }}
								<span *ngIf="locale.distanzaKm !== null && locale.distanzaKm !== undefined">
									• {{ locale.distanzaKm | number: '1.1-1' }} km da te
								</span>
							</p>

							<div class="map-detail-tags">
								<span class="detail-tag detail-tag-accent">{{ getBottomTypeLabel(locale.tipo) }}</span>
								<span class="detail-tag detail-tag-primary">Aperto ora</span>
							</div>
						</div>
					</article>
				</div>
			</section>
		</section>
	`,
})
export class NearbyPageComponent implements AfterViewInit, OnDestroy {
	@ViewChild('mapHost', { static: true }) private mapHost?: ElementRef<HTMLDivElement>;

	private readonly localeApi = inject(LocaleApiService);

	private leaflet: any;
	private map: any;
	private localeMarkersLayer: any;
	private userMarker: any;

	protected readonly filters: MapFilter[] = ['ALL', 'CLUB', 'BAR', 'JAZZ', 'LOUNGE'];
	protected readonly locali = signal<NearbyLocale[]>([]);
	protected readonly loading = signal(false);
	protected readonly error = signal('');
	protected readonly searchTerm = signal('');
	protected readonly activeFilter = signal<MapFilter>('ALL');
	protected readonly selectedLocaleId = signal<number | null>(null);
	protected readonly currentPosition = signal(DEFAULT_POSITION);
	protected readonly selectedLocaleDetail = signal<Locale | null>(null);
	protected readonly nearbyLimit = signal(RESULTS_STEP);
	private readonly mapReady = signal(false);
	private readonly detailsVersion = signal(0);
	private readonly localeDetailsCache = new Map<number, Locale>();

	protected readonly filteredLocales = computed(() => {
		const filter = this.activeFilter();
		const term = this.searchTerm().trim().toLowerCase();

		return this.locali().filter((locale) => {
			const matchesFilter = filter === 'ALL' || this.mapFilterForLocale(locale) === filter;
			const matchesText =
				term.length === 0 ||
				locale.nome.toLowerCase().includes(term) ||
				this.getSidebarMeta(locale).toLowerCase().includes(term) ||
				this.getSidebarCopy(locale).toLowerCase().includes(term);

			return matchesFilter && matchesText;
		});
	});

	protected readonly activeLocale = computed(() => {
		const selectedId = this.selectedLocaleId();
		if (selectedId === null) {
			return null;
		}

		return this.filteredLocales().find((locale) => locale.id === selectedId) ?? null;
	});

	protected readonly showExtendSearchButton = computed(
		() => !this.loading() && !this.error() && this.locali().length >= this.nearbyLimit(),
	);

	private readonly syncMapEffect = effect(() => {
		const ready = this.mapReady();
		const locales = this.filteredLocales();
		const active = this.activeLocale();
		const position = this.currentPosition();

		if (!ready) {
			return;
		}

		this.renderUserMarker(position.lat, position.lon);
		this.renderLocaleMarkers(locales, active);
	});

	constructor() {
		this.searchNearby(DEFAULT_POSITION.lat, DEFAULT_POSITION.lon);
	}

	async ngAfterViewInit(): Promise<void> {
		await this.initializeMap();
		this.requestUserPosition();
	}

	ngOnDestroy(): void {
		this.map?.remove();
	}

	protected handleSearchInput(event: Event): void {
		const target = event.target as HTMLInputElement;
		this.searchTerm.set(target.value);
		this.syncSelectionWithFilteredLocales();
	}

	protected setActiveFilter(filter: MapFilter): void {
		this.activeFilter.set(filter);
		this.syncSelectionWithFilteredLocales();
	}

	protected zoomIn(): void {
		this.map?.zoomIn();
	}

	protected zoomOut(): void {
		this.map?.zoomOut();
	}

	protected extendSearch(): void {
		const nextLimit = this.nearbyLimit() + RESULTS_STEP;
		this.nearbyLimit.set(nextLimit);
		const { lat, lon } = this.currentPosition();
		this.searchNearby(lat, lon, nextLimit);
	}

	protected centerOnUser(): void {
		if (!this.map) {
			return;
		}

		const { lat, lon } = this.currentPosition();
		this.map.flyTo([lat, lon], Math.max(this.map.getZoom(), 14), {
			animate: true,
			duration: 0.6,
		});
	}

	protected searchNearby(lat: number, lon: number, limit = this.nearbyLimit()): void {
		this.loading.set(true);
		this.error.set('');

		this.localeApi.getNearby(lat, lon, limit).subscribe({
			next: (locali) => {
				this.locali.set(locali);
				this.syncSelectionWithFilteredLocales();
				this.loading.set(false);
			},
			error: () => {
				this.locali.set([]);
				this.selectedLocaleId.set(null);
				this.selectedLocaleDetail.set(null);
				this.error.set('Non riesco a recuperare i locali vicini dal backend.');
				this.loading.set(false);
			},
		});
	}

	protected selectLocale(locale: NearbyLocale): void {
		this.selectedLocaleId.set(locale.id);
		this.loadLocaleDetail(locale.id);

		if (this.map) {
			this.map.flyTo([locale.latitudine, locale.longitudine], Math.max(this.map.getZoom(), 14), {
				animate: true,
				duration: 0.55,
			});
		}
	}

	protected getFilterLabel(filter: MapFilter): string {
		const labels: Record<MapFilter, string> = {
			ALL: 'Tutti',
			CLUB: 'Club',
			BAR: 'Bar',
			JAZZ: 'Jazz',
			LOUNGE: 'Lounge',
		};

		return labels[filter];
	}

	protected getTypeLabel(type: LocaleType): string {
		const labels: Record<LocaleType, string> = {
			DISCOTECA: 'Club',
			PUB: 'Bar',
			BAR: 'Jazz Bar',
			LOUNGE: 'Cocktail Bar',
			LIVE_CLUB: 'Club',
		};

		return labels[type];
	}

	protected getBottomTypeLabel(type: LocaleType): string {
		const labels: Record<LocaleType, string> = {
			DISCOTECA: 'Club',
			PUB: 'Bar',
			BAR: 'Club',
			LOUNGE: 'Club',
			LIVE_CLUB: 'Club',
		};

		return labels[type];
	}

	protected getTypeBadge(type: LocaleType): string {
		const labels: Record<LocaleType, string> = {
			DISCOTECA: 'CL',
			PUB: 'BR',
			BAR: 'JZ',
			LOUNGE: 'LG',
			LIVE_CLUB: 'CL',
		};

		return labels[type];
	}

	protected getSidebarMeta(locale: NearbyLocale): string {
		this.detailsVersion();
		const detail = this.localeDetailsCache.get(locale.id);
		const address = detail ? this.extractAddress(detail.descrizione) : null;
		return address
			? `${this.getTypeLabel(locale.tipo)} • ${address}`
			: this.getTypeLabel(locale.tipo);
	}

	protected getSidebarCopy(locale: NearbyLocale): string {
		this.detailsVersion();
		const detail = this.localeDetailsCache.get(locale.id);
		if (!detail) {
			return '';
		}

		return this.extractDescription(detail.descrizione);
	}

	protected getSelectedAddress(locale: NearbyLocale): string {
		const detail = this.selectedLocaleDetail();
		if (detail && detail.id === locale.id) {
			return this.extractAddress(detail.descrizione);
		}

		return 'Caricamento dettagli...';
	}

	private async initializeMap(): Promise<void> {
		if (!this.mapHost) {
			return;
		}

		try {
			this.leaflet = L;

			this.map = L.map(this.mapHost.nativeElement, {
				center: [DEFAULT_POSITION.lat, DEFAULT_POSITION.lon],
				zoom: 13,
				zoomControl: false,
				attributionControl: false,
			});

			L.tileLayer(CARTO_DARK_MATTER_URL, {
				subdomains: 'abcd',
				maxZoom: 20,
			}).addTo(this.map);

			L.control
				.attribution({
					position: 'bottomright',
					prefix: false,
				})
				.addAttribution('&copy; OpenStreetMap &copy; CARTO')
				.addTo(this.map);

			this.localeMarkersLayer = L.layerGroup().addTo(this.map);
			this.mapReady.set(true);

			setTimeout(() => {
				this.map?.invalidateSize();
			}, 0);
		} catch (error) {
			console.error('Leaflet initialization failed', error);
			this.error.set('Non riesco a inizializzare la mappa.');
		}
	}

	private requestUserPosition(): void {
		if (!('geolocation' in navigator)) {
			return;
		}

		navigator.geolocation.getCurrentPosition(
			(position) => {
				const nextPosition = {
					lat: position.coords.latitude,
					lon: position.coords.longitude,
				};

				this.currentPosition.set(nextPosition);
				this.centerOnUser();
				this.searchNearby(nextPosition.lat, nextPosition.lon);
			},
			() => {
				this.centerOnUser();
			},
			{
				enableHighAccuracy: true,
				timeout: 10000,
				maximumAge: 60000,
			},
		);
	}

	private renderUserMarker(lat: number, lon: number): void {
		if (!this.map || !this.leaflet) {
			return;
		}

		this.userMarker?.remove();

		this.userMarker = this.leaflet.marker([lat, lon], {
			interactive: false,
			zIndexOffset: 1000,
			icon: this.leaflet.divIcon({
				className: '',
				html: '<span class="leaflet-user-marker"></span>',
				iconSize: [24, 24],
				iconAnchor: [12, 12],
			}),
		});

		this.userMarker.addTo(this.map);
	}

	private renderLocaleMarkers(locales: NearbyLocale[], activeLocale: NearbyLocale | null): void {
		if (!this.localeMarkersLayer || !this.leaflet) {
			return;
		}

		this.localeMarkersLayer.clearLayers();

		locales.forEach((locale) => {
			const isActive = activeLocale?.id === locale.id;

			const marker = this.leaflet.marker([locale.latitudine, locale.longitudine], {
				keyboard: false,
				zIndexOffset: isActive ? 900 : 100,
				icon: this.leaflet.divIcon({
					className: isActive
						? 'leaflet-locale-marker leaflet-locale-marker-active'
						: 'leaflet-locale-marker',
					html: `
						<span class="leaflet-locale-marker-shell">
							${isActive ? `<span class="leaflet-locale-label">${this.escapeHtml(locale.nome)}</span>` : ''}
							<span class="leaflet-locale-dot"></span>
							${isActive ? '<span class="leaflet-locale-stem"></span>' : ''}
						</span>
          `,
					iconSize: isActive ? [160, 62] : [20, 20],
					iconAnchor: isActive ? [80, 62] : [10, 10],
				}),
			});

			marker.on('click', () => this.selectLocale(locale));
			marker.addTo(this.localeMarkersLayer);
		});
	}

	private mapFilterForLocale(locale: Pick<NearbyLocale, 'tipo'>): MapFilter {
		switch (locale.tipo) {
			case 'DISCOTECA':
			case 'LIVE_CLUB':
				return 'CLUB';
			case 'LOUNGE':
				return 'LOUNGE';
			case 'BAR':
				return 'JAZZ';
			default:
				return 'BAR';
		}
	}

	private syncSelectionWithFilteredLocales(): void {
		const selectedId = this.selectedLocaleId();
		const stillVisible = this.filteredLocales().some((locale) => locale.id === selectedId);

		if (!selectedId || !stillVisible) {
			this.selectedLocaleId.set(null);
			this.selectedLocaleDetail.set(null);
			if (!stillVisible) {
				this.localeMarkersLayer?.clearLayers();
				this.renderLocaleMarkers(this.filteredLocales(), null);
			}
		}
	}

	private extractAddress(description: string): string {
		return description.split('.')[0].trim() || 'Milano';
	}

	private extractDescription(description: string): string {
		const pieces = description.split('.');
		return pieces.slice(1).join('.').trim() || description;
	}

	private escapeHtml(value: string): string {
		return value
			.replaceAll('&', '&amp;')
			.replaceAll('<', '&lt;')
			.replaceAll('>', '&gt;')
			.replaceAll('"', '&quot;')
			.replaceAll("'", '&#39;');
	}

	private loadLocaleDetail(id: number): void {
		const cachedDetail = this.localeDetailsCache.get(id);
		if (cachedDetail) {
			this.selectedLocaleDetail.set(cachedDetail);
			return;
		}

		this.selectedLocaleDetail.set(null);

		this.localeApi.getById(id).subscribe({
			next: (detail) => {
				this.localeDetailsCache.set(detail.id, detail);
				this.detailsVersion.update((version) => version + 1);
				if (this.selectedLocaleId() === detail.id) {
					this.selectedLocaleDetail.set(detail);
				}
			},
			error: () => {
				if (this.selectedLocaleId() === id) {
					this.selectedLocaleDetail.set(null);
				}
			},
		});
	}
}
