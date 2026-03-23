import { DecimalPipe, NgIf } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Locale, LocaleType } from '../models/locale.model';
import { LocaleApiService } from '../services/locale-api.service';

interface MapLocale {
	locale: Locale;
	x: number;
	y: number;
}

const DEFAULT_MILAN_COORDS = {
	lat: 45.4642,
	lon: 9.19,
};

const MAP_POINTS = [
	{ x: 22, y: 28 },
	{ x: 61, y: 58 },
	{ x: 77, y: 38 },
];

const FALLBACK_LOCALES: Locale[] = [
	{
		id: 1,
		nome: 'Noir Social Club',
		descrizione: 'Via Tortona',
		latitudine: 45.451,
		longitudine: 9.168,
		tipo: 'LIVE_CLUB',
		distanzaKm: 0.3,
	},
	{
		id: 2,
		nome: 'Juke Lounge',
		descrizione: 'Navigli',
		latitudine: 45.4526,
		longitudine: 9.1736,
		tipo: 'LOUNGE',
		distanzaKm: 0.7,
	},
	{
		id: 3,
		nome: 'Blue Note Bistro',
		descrizione: 'Brera',
		latitudine: 45.4728,
		longitudine: 9.1862,
		tipo: 'BAR',
		distanzaKm: 1.1,
	},
];

@Component({
	selector: 'app-landing-page',
	standalone: true,
	imports: [RouterLink, NgIf, DecimalPipe],
	styleUrl: './landing-page.component.scss',
	template: `
		<section class="landing page">
			<section class="hero">
				<div class="hero-copy">
					<p class="location-pill">
						<span class="location-dot"></span>
						Posizione rilevata • Milano, MI
					</p>

					<p class="eyebrow">La citta non dorme mai</p>

					<h1>
						Trova il
						<span>tuo locale</span>
						stasera.
					</h1>

					<p class="lead">
						Locali notturni vicino a te, ordinati per distanza.
						<br />
						Cerca, esplora, esci.
					</p>

					<div class="hero-actions">
						<a routerLink="/mappa" class="pill-button primary-link">Esplora la mappa</a>
						<a href="#come-funziona" class="ghost-button secondary-link">Come funziona</a>
					</div>
				</div>

				<div class="map-panel" aria-hidden="true">
					<div class="map-grid"></div>
					<div class="map-band band-horizontal"></div>
					<div class="map-band band-vertical-left"></div>
					<div class="map-band band-vertical-right"></div>

					@for (item of mapLocales(); track item.locale.id; let index = $index) {
						<div class="map-pin" [class]="'map-pin map-pin-' + index">
							<span class="map-dot"></span>
							<span class="map-label">{{ item.locale.nome }}</span>
						</div>
					}
				</div>
			</section>

			<section class="showcase">
				<div class="section-copy">
					<p class="section-kicker">Piu vicini a te ora</p>
					<p *ngIf="loadError()" class="status status-info">
						La preview usa esempi demo mentre il backend non risponde.
					</p>
				</div>

				<div class="showcase-grid">
					@for (locale of featuredLocales(); track locale.id) {
						<article class="showcase-card panel">
							<p class="card-type">{{ getTypeLabel(locale.tipo) }}</p>
							<h2>{{ locale.nome }}</h2>
							<p class="card-meta">
								<span
									class="distance"
									*ngIf="locale.distanzaKm !== null && locale.distanzaKm !== undefined"
								>
									{{ locale.distanzaKm | number: '1.1-1' }} km
								</span>
								<span>{{ getAreaLabel(locale) }}</span>
							</p>
						</article>
					}
				</div>
			</section>

			<section id="come-funziona" class="info-grid">
				<article class="info-card panel">
					<p class="info-index">01</p>
					<h3>Condividi la tua zona</h3>
					<p>
						Partiamo da Milano come riferimento e ordiniamo i locali in base alla distanza dalla tua
						posizione.
					</p>
				</article>

				<article class="info-card panel">
					<p class="info-index">02</p>
					<h3>Filtra la notte giusta</h3>
					<p>
						Dalla mappa puoi aprire i dettagli, confrontare i posti e scegliere il mood giusto per
						stasera.
					</p>
				</article>

				<article class="info-card panel">
					<p class="info-index">03</p>
					<h3>Gestisci il catalogo</h3>
					<p>
						L&apos;area admin resta disponibile per aggiungere o aggiornare i locali mostrati in app.
					</p>
				</article>
			</section>
		</section>
	`,
})
export class LandingPageComponent {
	private readonly localeApi = inject(LocaleApiService);

	protected readonly featuredLocales = signal<Locale[]>(FALLBACK_LOCALES);
	protected readonly loadError = signal(false);
	protected readonly mapLocales = computed<MapLocale[]>(() =>
		this.featuredLocales()
			.slice(0, MAP_POINTS.length)
			.map((locale, index) => ({
				locale,
				x: MAP_POINTS[index]?.x ?? 50,
				y: MAP_POINTS[index]?.y ?? 50,
			})),
	);

	constructor() {
		this.loadFeaturedLocales();
	}

	protected getTypeLabel(type: LocaleType): string {
		const labels: Record<LocaleType, string> = {
			DISCOTECA: 'Club',
			PUB: 'Pub',
			BAR: 'Jazz Bar',
			LOUNGE: 'Cocktail Bar',
			LIVE_CLUB: 'Club',
		};

		return labels[type];
	}

	protected getAreaLabel(locale: Locale): string {
		return locale.descrizione.trim() || 'Milano centro';
	}

	private loadFeaturedLocales(): void {
		this.localeApi.getNearby(DEFAULT_MILAN_COORDS.lat, DEFAULT_MILAN_COORDS.lon).subscribe({
			next: (locali) => {
				if (locali.length > 0) {
					this.featuredLocales.set(
						locali.slice(0, 3).map((locale) => ({
							...locale,
							descrizione: 'Milano centro',
						})),
					);
					this.loadError.set(false);
				}
			},
			error: () => {
				this.loadError.set(true);
			},
		});
	}
}
