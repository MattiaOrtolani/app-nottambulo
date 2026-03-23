import { Component, inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../auth/auth.service';

@Component({
	selector: 'app-login-page',
	standalone: true,
	styleUrl: './login-page.component.scss',
	template: `
		<section class="page login-page">
			<article class="panel login-card">
				<p class="eyebrow">Accesso amministrativo</p>
				<h1>Entra con Keycloak per gestire i locali.</h1>
				<p>
					Il backoffice e le API di scrittura sono disponibili solo agli utenti con ruolo
					<strong>admin</strong>.
				</p>

				<div class="actions">
					<button class="pill-button" (click)="login()">Login con Keycloak</button>
					<button class="ghost-button" (click)="logout()">Logout</button>
				</div>
			</article>
		</section>
	`,
})
export class LoginPageComponent {
	private readonly authService = inject(AuthService);
	private readonly route = inject(ActivatedRoute);

	protected login(): void {
		const returnUrl = this.route.snapshot.queryParamMap.get('returnUrl') ?? '/admin/locali';
		const redirectUri = returnUrl.startsWith('http')
			? returnUrl
			: `${window.location.origin}${returnUrl}`;
		void this.authService.login(redirectUri);
	}

	protected logout(): void {
		void this.authService.logout();
	}
}
