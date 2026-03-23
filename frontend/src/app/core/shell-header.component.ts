import { Component, inject } from '@angular/core';
import { NgIf } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';
import { AuthService } from '../auth/auth.service';

@Component({
	selector: 'app-shell-header',
	standalone: true,
	imports: [NgIf, RouterLink, RouterLinkActive],
	styleUrl: './shell-header.component.scss',
	template: `
		<header class="shell-header">
			<div class="page shell-bar">
				<a routerLink="/" class="brand-mark">Nottambulo</a>
				<nav class="nav">
					<a routerLink="/" routerLinkActive="active" [routerLinkActiveOptions]="{ exact: true }"
						>Landing</a
					>
					<a routerLink="/mappa" routerLinkActive="active">Mappa</a>
					<a routerLink="/admin/locali" routerLinkActive="active">Admin</a>
				</nav>

				<div class="session" *ngIf="authService.authenticated()">
					<span class="welcome">
						{{ authService.profile()?.firstName || authService.profile()?.username || 'Admin' }}
					</span>
					<button class="ghost-button logout-button" (click)="logout()">Logout</button>
				</div>
			</div>
		</header>
	`,
})
export class ShellHeaderComponent {
	protected readonly authService = inject(AuthService);

	protected logout(): void {
		void this.authService.logout();
	}
}
