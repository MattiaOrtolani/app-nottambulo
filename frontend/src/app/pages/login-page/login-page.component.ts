import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../../auth/auth.service';

@Component({
	selector: 'app-login-page',
	standalone: true,
	imports: [FormsModule],
	styleUrl: './login-page.component.scss',
	templateUrl: './login-page.component.html',
})
export class LoginPageComponent {
	protected readonly authService = inject(AuthService);
	private readonly route = inject(ActivatedRoute);
	private readonly router = inject(Router);

	protected username = 'admin';
	protected password = 'admin';
	protected error = signal<string | null>(null);

	protected login(): void {
		const returnUrl = this.route.snapshot.queryParamMap.get('returnUrl') ?? '/admin/locali';
		this.error.set(null);
		this.authService.login(this.username, this.password).subscribe({
			next: (response) => {
				this.authService.storeSession(response);
				void this.router.navigateByUrl(returnUrl);
			},
			error: () => this.error.set('Credenziali non valide. Usa admin/admin per la demo.'),
		});
	}

	protected logout(): void {
		this.authService.logout();
	}
}
