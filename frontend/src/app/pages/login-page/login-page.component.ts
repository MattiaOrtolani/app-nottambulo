import { Component, inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../../auth/auth.service';

@Component({
	selector: 'app-login-page',
	standalone: true,
	styleUrl: './login-page.component.scss',
	templateUrl: './login-page.component.html',
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
