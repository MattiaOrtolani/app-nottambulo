import { NgIf } from '@angular/common';
import {
	Component,
	EventEmitter,
	Input,
	OnChanges,
	Output,
	SimpleChanges,
	inject,
} from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { CreateLocaleRequest, LOCALE_TYPES, Locale, LocaleType } from '../models/locale.model';

@Component({
	selector: 'app-locale-form',
	standalone: true,
	imports: [NgIf, ReactiveFormsModule],
	styleUrl: './locale-form.component.scss',
	template: `
		<form class="locale-form" [formGroup]="form" (ngSubmit)="submit()">
			<div class="title-row" id="nuovo-locale">
				<div>
					<p class="eyebrow">Nottambulo backoffice</p>
					<h2>{{ editing ? 'Modifica locale' : 'Inserisci locale' }}</h2>
				</div>
				<button *ngIf="editing" class="ghost-button" type="button" (click)="cancel.emit()">
					Annulla modifica
				</button>
			</div>

			<section class="form-section panel">
				<div class="section-header">
					<p class="section-eyebrow">Dati principali</p>
				</div>

				<div class="field-grid">
					<div class="field">
						<label for="nome">Nome locale</label>
						<input id="nome" type="text" formControlName="nome" placeholder="es. Noir Social Club" />
					</div>

					<div class="field">
						<label for="tipo">Tipo</label>
						<select id="tipo" formControlName="tipo">
							@for (tipo of localeTypes; track tipo) {
								<option [value]="tipo">{{ getTypeLabel(tipo) }}</option>
							}
						</select>
					</div>

					<div class="field full">
						<label for="descrizione">Descrizione</label>
						<textarea
							id="descrizione"
							rows="6"
							formControlName="descrizione"
							placeholder="Breve descrizione del locale..."
						></textarea>
					</div>
				</div>
			</section>

			<section class="form-section panel">
				<div class="section-header">
					<p class="section-eyebrow">Localizzazione GPS</p>
				</div>

				<div class="field-grid">
					<div class="field">
						<label for="lat">Latitudine</label>
						<input
							id="lat"
							type="number"
							step="0.000001"
							formControlName="latitudine"
							placeholder="es. 45.4654"
						/>
					</div>

					<div class="field">
						<label for="lon">Longitudine</label>
						<input
							id="lon"
							type="number"
							step="0.000001"
							formControlName="longitudine"
							placeholder="es. 9.1859"
						/>
					</div>
				</div>
			</section>

			<div class="form-actions">
				<button class="pill-button" type="submit" [disabled]="form.invalid">
					{{ editing ? 'Salva modifiche' : 'Salva locale' }}
				</button>
			</div>
		</form>
	`,
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
		tipo: ['DISCOTECA' as LocaleType, [Validators.required]],
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
			tipo: this.locale?.tipo ?? 'DISCOTECA',
		});
	}

	protected submit(): void {
		if (this.form.invalid) {
			this.form.markAllAsTouched();
			return;
		}

		this.save.emit(this.form.getRawValue());
	}

	protected getTypeLabel(type: LocaleType): string {
		const labels: Record<LocaleType, string> = {
			DISCOTECA: 'Club',
			PUB: 'Pub',
			BAR: 'Bar',
			LOUNGE: 'Lounge',
			LIVE_CLUB: 'Live Club',
		};

		return labels[type];
	}
}
