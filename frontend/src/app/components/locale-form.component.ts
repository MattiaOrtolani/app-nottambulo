import { NgIf } from '@angular/common';
import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { CreateLocaleRequest, LOCALE_TYPES, Locale, LocaleType } from '../models/locale.model';

@Component({
  selector: 'app-locale-form',
  standalone: true,
  imports: [NgIf, ReactiveFormsModule],
  template: `
    <form class="locale-form panel" [formGroup]="form" (ngSubmit)="submit()">
      <div class="title-row">
        <div>
          <p class="eyebrow">Area admin</p>
          <h2>{{ editing ? 'Modifica locale' : 'Nuovo locale' }}</h2>
        </div>
        <button *ngIf="editing" class="ghost-button" type="button" (click)="cancel.emit()">Annulla</button>
      </div>

      <div class="field full">
        <label for="nome">Nome</label>
        <input id="nome" type="text" formControlName="nome" />
      </div>

      <div class="field full">
        <label for="descrizione">Descrizione</label>
        <textarea id="descrizione" rows="4" formControlName="descrizione"></textarea>
      </div>

      <div class="field">
        <label for="lat">Latitudine</label>
        <input id="lat" type="number" step="0.000001" formControlName="latitudine" />
      </div>

      <div class="field">
        <label for="lon">Longitudine</label>
        <input id="lon" type="number" step="0.000001" formControlName="longitudine" />
      </div>

      <div class="field">
        <label for="tipo">Tipo</label>
        <select id="tipo" formControlName="tipo">
          @for (tipo of localeTypes; track tipo) {
            <option [value]="tipo">{{ tipo }}</option>
          }
        </select>
      </div>

      <button class="pill-button" type="submit" [disabled]="form.invalid">
        {{ editing ? 'Salva modifiche' : 'Crea locale' }}
      </button>
    </form>
  `,
  styles: [`
    .locale-form {
      display: grid;
      gap: 1rem;
      padding: 1.25rem;
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .title-row,
    .full,
    button {
      grid-column: 1 / -1;
    }

    .title-row {
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
      font-size: 0.72rem;
    }

    .field {
      display: grid;
      gap: 0.45rem;
    }

    input,
    textarea,
    select {
      border: 1px solid var(--line);
      border-radius: var(--radius-md);
      padding: 0.85rem 0.95rem;
      background: rgba(255, 255, 255, 0.75);
    }

    @media (max-width: 720px) {
      .locale-form {
        grid-template-columns: 1fr;
      }

      .title-row {
        flex-direction: column;
      }
    }
  `]
})
export class LocaleFormComponent implements OnChanges {
  private readonly fb = inject(FormBuilder);

  @Input() locale: Locale | null = null;
  @Output() save = new EventEmitter<CreateLocaleRequest>();
  @Output() cancel = new EventEmitter<void>();

  protected readonly localeTypes = LOCALE_TYPES;
  protected editing = false;

  protected readonly form = this.fb.nonNullable.group({
    nome: ['', [Validators.required, Validators.maxLength(120)]],
    descrizione: ['', [Validators.required, Validators.maxLength(1200)]],
    latitudine: [45.4642, [Validators.required, Validators.min(-90), Validators.max(90)]],
    longitudine: [9.19, [Validators.required, Validators.min(-180), Validators.max(180)]],
    tipo: ['DISCOTECA' as LocaleType, [Validators.required]]
  });

  ngOnChanges(changes: SimpleChanges): void {
    if (!changes['locale']) {
      return;
    }

    this.editing = !!this.locale;
    this.form.reset({
      nome: this.locale?.nome ?? '',
      descrizione: this.locale?.descrizione ?? '',
      latitudine: this.locale?.latitudine ?? 45.4642,
      longitudine: this.locale?.longitudine ?? 9.19,
      tipo: this.locale?.tipo ?? 'DISCOTECA'
    });
  }

  protected submit(): void {
    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }

    this.save.emit(this.form.getRawValue());
  }
}
