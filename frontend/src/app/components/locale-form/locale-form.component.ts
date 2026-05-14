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
import { CreateLocaleRequest, LOCALE_TYPES, Locale, LocaleType } from '../../models/locale.model';

@Component({
	selector: 'app-locale-form',
	standalone: true,
	imports: [NgIf, ReactiveFormsModule],
	styleUrl: './locale-form.component.scss',
	templateUrl: './locale-form.component.html',
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
