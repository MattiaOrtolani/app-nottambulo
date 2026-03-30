import { NgIf } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import { AuthService } from '../../auth/auth.service';
import { LocaleCardComponent } from '../../components/locale-card/locale-card.component';
import { LocaleFormComponent } from '../../components/locale-form/locale-form.component';
import { CreateLocaleRequest, Locale, LOCALE_TYPES, LocaleType } from '../../models/locale.model';
import { LocaleApiService } from '../../services/locale-api.service';

type SortOption = 'name-asc' | 'name-desc' | 'recent-first' | 'oldest-first';

@Component({
	selector: 'app-admin-locali-page',
	standalone: true,
	imports: [NgIf, LocaleFormComponent, LocaleCardComponent],
	styleUrl: './admin-locali-page.component.scss',
	templateUrl: './admin-locali-page.component.html',
})
export class AdminLocaliPageComponent {
	private readonly localeApi = inject(LocaleApiService);
	protected readonly authService = inject(AuthService);

	protected readonly locali = signal<Locale[]>([]);
	protected readonly selectedLocale = signal<Locale | null>(null);
	protected readonly loading = signal(false);
	protected readonly error = signal('');
	protected readonly message = signal('');
	protected readonly searchQuery = signal('');
	protected readonly selectedType = signal<LocaleType | null>(null);
	protected readonly sortOption = signal<SortOption>('recent-first');
	protected readonly localeTypes = LOCALE_TYPES;
	protected readonly filteredLocali = computed(() => {
		const query = this.searchQuery().trim().toLowerCase();
		const selectedType = this.selectedType();
		const sortOption = this.sortOption();

		const filtered = this.locali().filter((locale) => {
			const matchesType = !selectedType || locale.tipo === selectedType;
			const haystack = [locale.nome, locale.descrizione, this.formatLocaleType(locale.tipo)].join(' ').toLowerCase();
			const matchesQuery = query.length === 0 || haystack.includes(query);
			return matchesType && matchesQuery;
		});

		return [...filtered].sort((left, right) => {
			switch (sortOption) {
				case 'name-asc':
					return left.nome.localeCompare(right.nome, 'it', { sensitivity: 'base' });
				case 'name-desc':
					return right.nome.localeCompare(left.nome, 'it', { sensitivity: 'base' });
				case 'oldest-first':
					return left.id - right.id;
				case 'recent-first':
				default:
					return right.id - left.id;
			}
		});
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

	protected updateSearchQuery(value: string): void {
		this.searchQuery.set(value);
	}

	protected updateSelectedType(value: string): void {
		this.selectedType.set(value ? (value as LocaleType) : null);
	}

	protected updateSortOption(value: string): void {
		this.sortOption.set(value as SortOption);
	}

	protected resetFilters(): void {
		this.searchQuery.set('');
		this.selectedType.set(null);
		this.sortOption.set('recent-first');
	}

	protected formatLocaleType(type: LocaleType): string {
		return type.replace('_', ' ').toLowerCase().replace(/\b\w/g, (letter) => letter.toUpperCase());
	}
}
