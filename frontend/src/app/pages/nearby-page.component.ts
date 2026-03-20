import { NgIf } from '@angular/common';
import { Component, inject, signal } from '@angular/core';
import { LocaleCardComponent } from '../components/locale-card.component';
import { LocaleSearchFormComponent } from '../components/locale-search-form.component';
import { Locale } from '../models/locale.model';
import { LocaleApiService } from '../services/locale-api.service';

@Component({
  selector: 'app-nearby-page',
  standalone: true,
  imports: [NgIf, LocaleCardComponent, LocaleSearchFormComponent],
  template: `
    <section class="page page-grid">
      <section class="hero panel">
        <p class="eyebrow">Ricerca pubblica</p>
        <h1>Scopri i locali notturni piu vicini alla tua posizione.</h1>
        <p class="lead">
          Cerca i primi 10 locali ordinati per distanza crescente e consulta i dettagli senza autenticazione.
        </p>
        <app-locale-search-form (search)="searchNearby($event.latitudine, $event.longitudine)"></app-locale-search-form>
      </section>

      <section class="results">
        <div class="section-heading">
          <div>
            <p class="eyebrow">Risultati</p>
            <h2>Top 10 nelle vicinanze</h2>
          </div>
          <span class="counter">{{ locali().length }} trovati</span>
        </div>

        <p *ngIf="loading()" class="status status-info">Sto cercando i locali piu vicini...</p>
        <p *ngIf="error()" class="status status-error">{{ error() }}</p>

        <div class="result-grid" *ngIf="locali().length > 0">
          @for (locale of locali(); track locale.id) {
            <app-locale-card [locale]="locale"></app-locale-card>
          }
        </div>

        <p *ngIf="!loading() && !error() && locali().length === 0" class="status status-info">
          Nessun risultato al momento. Inserisci coordinate valide per avviare la ricerca.
        </p>
      </section>
    </section>
  `,
  styles: [`
    .page-grid {
      display: grid;
      gap: 1.5rem;
      padding-top: 1.5rem;
    }

    .hero {
      padding: 1.6rem;
      display: grid;
      gap: 1rem;
    }

    .eyebrow {
      margin: 0;
      text-transform: uppercase;
      letter-spacing: 0.18rem;
      font-size: 0.74rem;
      color: var(--muted);
    }

    h1,
    h2,
    .lead {
      margin: 0;
    }

    h1 {
      max-width: 12ch;
      font-size: clamp(2.2rem, 5vw, 4.6rem);
      line-height: 0.96;
    }

    .lead {
      max-width: 52rem;
      color: var(--muted);
      font-size: 1.05rem;
    }

    .results {
      display: grid;
      gap: 1rem;
    }

    .section-heading {
      display: flex;
      justify-content: space-between;
      gap: 1rem;
      align-items: end;
    }

    .counter {
      color: var(--muted);
    }

    .result-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 1rem;
    }
  `]
})
export class NearbyPageComponent {
  private readonly localeApi = inject(LocaleApiService);

  protected readonly locali = signal<Locale[]>([]);
  protected readonly loading = signal(false);
  protected readonly error = signal('');

  constructor() {
    this.searchNearby(45.4642, 9.19);
  }

  protected searchNearby(lat: number, lon: number): void {
    this.loading.set(true);
    this.error.set('');

    this.localeApi.getNearby(lat, lon).subscribe({
      next: (locali) => {
        this.locali.set(locali);
        this.loading.set(false);
      },
      error: () => {
        this.error.set('Non riesco a recuperare i locali vicini. Controlla backend e coordinate.');
        this.loading.set(false);
      }
    });
  }
}
