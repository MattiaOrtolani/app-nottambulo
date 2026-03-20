import { NgIf } from '@angular/common';
import { Component, inject, signal } from '@angular/core';
import { LocaleCardComponent } from '../components/locale-card.component';
import { LocaleFormComponent } from '../components/locale-form.component';
import { CreateLocaleRequest, Locale } from '../models/locale.model';
import { LocaleApiService } from '../services/locale-api.service';

@Component({
  selector: 'app-admin-locali-page',
  standalone: true,
  imports: [NgIf, LocaleFormComponent, LocaleCardComponent],
  template: `
    <section class="page admin-grid">
      <app-locale-form
        [locale]="selectedLocale()"
        (save)="handleSave($event)"
        (cancel)="resetSelection()"
      ></app-locale-form>

      <section class="admin-list panel">
        <div class="list-header">
          <div>
            <p class="eyebrow">Backoffice</p>
            <h2>Gestione locali</h2>
          </div>
          <button class="ghost-button" (click)="loadLocali()">Aggiorna lista</button>
        </div>

        <p *ngIf="loading()" class="status status-info">Sto caricando i locali...</p>
        <p *ngIf="message()" class="status status-success">{{ message() }}</p>
        <p *ngIf="error()" class="status status-error">{{ error() }}</p>

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
      </section>
    </section>
  `,
  styles: [`
    .admin-grid {
      display: grid;
      gap: 1.5rem;
      padding-top: 1.5rem;
      grid-template-columns: minmax(320px, 400px) minmax(0, 1fr);
      align-items: start;
    }

    .admin-list {
      padding: 1.25rem;
      display: grid;
      gap: 1rem;
    }

    .list-header {
      display: flex;
      justify-content: space-between;
      gap: 1rem;
      align-items: flex-start;
    }

    .eyebrow,
    h2 {
      margin: 0;
    }

    .eyebrow {
      color: var(--muted);
      text-transform: uppercase;
      letter-spacing: 0.16rem;
      font-size: 0.74rem;
    }

    .admin-items {
      display: grid;
      gap: 1rem;
    }

    .admin-item {
      display: grid;
      gap: 0.8rem;
    }

    .item-actions {
      display: flex;
      gap: 0.75rem;
      justify-content: flex-end;
      flex-wrap: wrap;
    }

    @media (max-width: 980px) {
      .admin-grid {
        grid-template-columns: 1fr;
      }
    }
  `]
})
export class AdminLocaliPageComponent {
  private readonly localeApi = inject(LocaleApiService);

  protected readonly locali = signal<Locale[]>([]);
  protected readonly selectedLocale = signal<Locale | null>(null);
  protected readonly loading = signal(false);
  protected readonly error = signal('');
  protected readonly message = signal('');

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
        this.error.set('Non riesco a leggere l\'elenco locali. Verifica backend e token admin.');
        this.loading.set(false);
      }
    });
  }

  protected editLocale(locale: Locale): void {
    this.selectedLocale.set(locale);
    this.message.set('');
  }

  protected resetSelection(): void {
    this.selectedLocale.set(null);
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
        this.message.set(selected ? 'Locale aggiornato correttamente.' : 'Locale creato correttamente.');
        this.resetSelection();
        this.loadLocali();
      },
      error: () => {
        this.error.set('Operazione non riuscita. Controlla validazione e permessi admin.');
      }
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
      }
    });
  }
}
