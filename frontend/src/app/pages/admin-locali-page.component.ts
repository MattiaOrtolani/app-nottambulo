import { NgIf } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import { AuthService } from '../auth/auth.service';
import { LocaleCardComponent } from '../components/locale-card.component';
import { LocaleFormComponent } from '../components/locale-form.component';
import { CreateLocaleRequest, Locale } from '../models/locale.model';
import { LocaleApiService } from '../services/locale-api.service';

@Component({
	selector: 'app-admin-locali-page',
	standalone: true,
	imports: [NgIf, LocaleFormComponent, LocaleCardComponent],
	styleUrl: './admin-locali-page.component.scss',
	template: `
		<section class="page admin-layout">
			<aside class="admin-sidebar panel">
				<div class="sidebar-head">
					<p class="brand-mark">Nottambulo</p>
					<p class="sidebar-kicker">Backoffice</p>
				</div>

				<nav class="sidebar-nav">
					<a href="#nuovo-locale" class="sidebar-link sidebar-link-active">Nuovo locale</a>
					<a href="#gestione-locali" class="sidebar-link">Gestione locali</a>
				</nav>

				<button class="logout-link" type="button" (click)="logout()">Esci</button>
			</aside>

			<div class="admin-main">
				<div class="admin-topbar">
					<div>
						<p class="eyebrow">Area riservata</p>
						<h1>{{ selectedLocale() ? 'Modifica locale' : 'Inserisci locale' }}</h1>
					</div>
					<p class="session-label">
						{{ authService.authenticated() ? 'Admin autenticato' : 'Sessione non attiva' }}
					</p>
				</div>

				<section class="stats-grid">
					<article class="stat-card panel">
						<p class="stat-label">Totale locali</p>
						<p class="stat-value">
							{{ locali().length }}
							<span>attivi</span>
						</p>
					</article>

					<article class="stat-card panel">
						<p class="stat-label">Zone coperte</p>
						<p class="stat-value">
							{{ coveredAreas() }}
							<span>quartieri</span>
						</p>
					</article>
				</section>

				<p *ngIf="loading()" class="status status-info">Sto caricando i locali...</p>
				<p *ngIf="message()" class="status status-success">{{ message() }}</p>
				<p *ngIf="error()" class="status status-error">{{ error() }}</p>

				<app-locale-form
					[locale]="selectedLocale()"
					(save)="handleSave($event)"
					(cancel)="resetSelection()"
				></app-locale-form>

				<section class="admin-list panel" id="gestione-locali">
					<div class="list-header">
						<div>
							<p class="section-kicker">Locali registrati</p>
							<h2>Gestione locali</h2>
						</div>
						<button class="ghost-button" (click)="loadLocali()">Aggiorna lista</button>
					</div>

					<div class="admin-items" *ngIf="locali().length > 0">
						@for (locale of locali(); track locale.id) {
							<div class="admin-item">
								<app-locale-card [locale]="locale"></app-locale-card>
								<div class="item-actions">
									<button class="ghost-button" (click)="editLocale(locale)">Modifica</button>
									<button class="danger-button" (click)="deleteLocale(locale.id)">Elimina</button>
								</div>
							</div>
						}
					</div>

					<p *ngIf="!loading() && locali().length === 0" class="status status-info">
						Nessun locale registrato al momento.
					</p>
				</section>
			</div>
		</section>
	`,
})
export class AdminLocaliPageComponent {
	private readonly localeApi = inject(LocaleApiService);
	protected readonly authService = inject(AuthService);

	protected readonly locali = signal<Locale[]>([]);
	protected readonly selectedLocale = signal<Locale | null>(null);
	protected readonly loading = signal(false);
	protected readonly error = signal('');
	protected readonly message = signal('');
	protected readonly coveredAreas = computed(() => {
		const areas = this.locali()
			.map((locale) => this.extractArea(locale.descrizione))
			.filter((area) => area.length > 0);

		return new Set(areas).size;
	});

	constructor() {
		this.loadLocali();
	}

	protected loadLocali(): void {
		this.loading.set(true);
		this.error.set('');

		this.localeApi.getAll().subscribe({
			next: (locali) => {
				this.locali.set(locali);
				this.loading.set(false);
			},
			error: () => {
				this.error.set("Non riesco a leggere l'elenco locali. Verifica backend e token admin.");
				this.loading.set(false);
			},
		});
	}

	protected editLocale(locale: Locale): void {
		this.selectedLocale.set(locale);
		this.message.set('');
	}

	protected resetSelection(): void {
		this.selectedLocale.set(null);
	}

	protected logout(): void {
		void this.authService.logout();
	}

	protected handleSave(payload: CreateLocaleRequest): void {
		this.error.set('');
		this.message.set('');

		const selected = this.selectedLocale();
		const request$ = selected
			? this.localeApi.updateLocale(selected.id, payload)
			: this.localeApi.createLocale(payload);

		request$.subscribe({
			next: () => {
				this.message.set(
					selected ? 'Locale aggiornato correttamente.' : 'Locale creato correttamente.',
				);
				this.resetSelection();
				this.loadLocali();
			},
			error: () => {
				this.error.set('Operazione non riuscita. Controlla validazione e permessi admin.');
			},
		});
	}

	protected deleteLocale(id: number): void {
		this.error.set('');
		this.message.set('');

		this.localeApi.deleteLocale(id).subscribe({
			next: () => {
				this.message.set('Locale eliminato correttamente.');
				if (this.selectedLocale()?.id === id) {
					this.resetSelection();
				}
				this.loadLocali();
			},
			error: () => {
				this.error.set('Eliminazione non riuscita. Controlla i permessi admin.');
			},
		});
	}

	private extractArea(description: string): string {
		return description.split(/[,.]/)[0].trim().toLowerCase();
	}
}
