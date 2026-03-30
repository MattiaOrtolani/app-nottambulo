import { Component, inject, signal } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { filter } from 'rxjs/operators';
import { ShellHeaderComponent } from '../core/shell-header/shell-header.component';

@Component({
	selector: 'app-root',
	standalone: true,
	imports: [RouterOutlet, ShellHeaderComponent],
	templateUrl: './app.html',
	styleUrl: './app.scss',
})
export class App {
	private readonly router = inject(Router);
	protected readonly isMapRoute = signal(this.router.url.startsWith('/mappa'));

	constructor() {
		this.router.events
			.pipe(filter((event): event is NavigationEnd => event instanceof NavigationEnd))
			.subscribe((event) => {
				this.isMapRoute.set(event.urlAfterRedirects.startsWith('/mappa'));
			});
	}
}
