import { DecimalPipe, NgIf, TitleCasePipe } from '@angular/common';
import { Component, Input } from '@angular/core';
import { Locale } from '../models/locale.model';

@Component({
  selector: 'app-locale-card',
  standalone: true,
  imports: [DecimalPipe, NgIf, TitleCasePipe],
  template: `
    <article class="card panel">
      <div class="card-top">
        <span class="tag">{{ locale.tipo | titlecase }}</span>
        <span *ngIf="locale.distanzaKm !== null && locale.distanzaKm !== undefined" class="distance">
          {{ locale.distanzaKm | number: '1.1-2' }} km
        </span>
      </div>

      <h3>{{ locale.nome }}</h3>
      <p>{{ locale.descrizione }}</p>

      <div class="coords">
        <span>Lat {{ locale.latitudine | number: '1.2-5' }}</span>
        <span>Lon {{ locale.longitudine | number: '1.2-5' }}</span>
      </div>
    </article>
  `,
  styles: [`
    .card {
      padding: 1.2rem;
      display: grid;
      gap: 0.9rem;
    }

    .card-top,
    .coords {
      display: flex;
      justify-content: space-between;
      gap: 0.75rem;
      flex-wrap: wrap;
    }

    .tag,
    .distance {
      border-radius: 999px;
      padding: 0.35rem 0.7rem;
      font-size: 0.82rem;
      background: rgba(255, 215, 199, 0.7);
      color: var(--accent-dark);
    }

    h3,
    p {
      margin: 0;
    }

    p,
    .coords {
      color: var(--muted);
    }
  `]
})
export class LocaleCardComponent {
  @Input({ required: true }) locale!: Locale;
}
