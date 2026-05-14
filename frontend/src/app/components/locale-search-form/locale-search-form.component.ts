import { Component, EventEmitter, Output, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
	selector: 'app-locale-search-form',
	standalone: true,
	imports: [ReactiveFormsModule],
	styleUrl: './locale-search-form.component.scss',
	templateUrl: './locale-search-form.component.html',
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
