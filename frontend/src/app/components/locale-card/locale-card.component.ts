import { DecimalPipe, NgIf, TitleCasePipe } from '@angular/common';
import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Locale } from '../../models/locale.model';

@Component({
	selector: 'app-locale-card',
	standalone: true,
	imports: [DecimalPipe, NgIf, TitleCasePipe],
	styleUrl: './locale-card.component.scss',
	templateUrl: './locale-card.component.html',
})
export class LocaleCardComponent {
	@Input({ required: true }) locale!: Locale;
	@Output() edit = new EventEmitter<void>();
	@Output() delete = new EventEmitter<void>();
}
