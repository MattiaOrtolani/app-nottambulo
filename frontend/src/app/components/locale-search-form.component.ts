import { Component, EventEmitter, Output, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
	selector: 'app-locale-search-form',
	standalone: true,
	imports: [ReactiveFormsModule],
	styleUrl: './locale-search-form.component.scss',
	template: `
		<form class="search-form panel" [formGroup]="form" (ngSubmit)="submit()">
			<div class="field">
				<label for="latitudine">Latitudine</label>
				<input id="latitudine" type="number" step="0.000001" formControlName="latitudine" />
			</div>

			<div class="field">
				<label for="longitudine">Longitudine</label>
				<input id="longitudine" type="number" step="0.000001" formControlName="longitudine" />
			</div>

			<button class="pill-button" type="submit" [disabled]="form.invalid">Cerca locali</button>
		</form>
	`,
})
export class LocaleSearchFormComponent {
	private readonly fb = inject(FormBuilder);

	@Output() search = new EventEmitter<{ latitudine: number; longitudine: number }>();

	protected readonly form = this.fb.nonNullable.group({
		latitudine: [45.4642, [Validators.required, Validators.min(-90), Validators.max(90)]],
		longitudine: [9.19, [Validators.required, Validators.min(-180), Validators.max(180)]],
	});

	protected submit(): void {
		if (this.form.invalid) {
			this.form.markAllAsTouched();
			return;
		}

		this.search.emit(this.form.getRawValue());
	}
}
