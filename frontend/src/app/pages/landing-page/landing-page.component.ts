import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
	selector: 'app-landing-page',
	standalone: true,
	imports: [RouterLink],
	styleUrl: './landing-page.component.scss',
	templateUrl: './landing-page.component.html',
})
export class LandingPageComponent {}
