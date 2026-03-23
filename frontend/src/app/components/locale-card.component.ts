import { DecimalPipe, NgIf, TitleCasePipe } from '@angular/common';
import { Component, Input } from '@angular/core';
import { Locale } from '../models/locale.model';

@Component({
	selector: 'app-locale-card',
	standalone: true,
	imports: [DecimalPipe, NgIf, TitleCasePipe],
	styleUrl: './locale-card.component.scss',
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
})
export class LocaleCardComponent {
	@Input({ required: true }) locale!: Locale;
}
