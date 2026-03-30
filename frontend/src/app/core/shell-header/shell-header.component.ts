import { Component, inject } from '@angular/core';
import { NgIf } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';
import { NAVIGATION_LINKS } from '../navigation-links';
import { AuthService } from '../../auth/auth.service';

@Component({
	selector: 'app-shell-header',
	standalone: true,
	imports: [NgIf, RouterLink, RouterLinkActive],
	styleUrl: './shell-header.component.scss',
	templateUrl: './shell-header.component.html',
})
export class ShellHeaderComponent {
	protected readonly authService = inject(AuthService);
	protected readonly primaryNavLinks = NAVIGATION_LINKS.filter(
		(link) => link.path === '/' || link.path === '/mappa',
	);
	protected readonly exactOptions = { exact: true } as const;
	protected readonly looseOptions = { exact: false } as const;

	protected logout(): void {
		void this.authService.logout();
	}
}
