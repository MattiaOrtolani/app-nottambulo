import { Component, inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../auth/auth.service';

@Component({
  selector: 'app-login-page',
  standalone: true,
  template: `
    <section class="page login-page">
      <article class="panel login-card">
        <p class="eyebrow">Accesso amministrativo</p>
        <h1>Entra con Keycloak per gestire i locali.</h1>
        <p>
          Il backoffice e le API di scrittura sono disponibili solo agli utenti con ruolo <strong>admin</strong>.
        </p>

        <div class="actions">
          <button class="pill-button" (click)="login()">Login con Keycloak</button>
          <button class="ghost-button" (click)="logout()">Logout</button>
        </div>
      </article>
    </section>
  `,
  styles: [`
    .login-page {
      padding-top: 2rem;
    }

    .login-card {
      max-width: 720px;
      margin: 0 auto;
      padding: 1.8rem;
      display: grid;
      gap: 1rem;
    }

    .eyebrow,
    h1,
    p {
      margin: 0;
    }

    .eyebrow {
      color: var(--muted);
      text-transform: uppercase;
      letter-spacing: 0.16rem;
      font-size: 0.74rem;
    }

    .actions {
      display: flex;
      gap: 0.8rem;
      flex-wrap: wrap;
    }
  `]
})
export class LoginPageComponent {
  private readonly authService = inject(AuthService);
  private readonly route = inject(ActivatedRoute);

  protected login(): void {
    const returnUrl = this.route.snapshot.queryParamMap.get('returnUrl') ?? '/admin/locali';
    const redirectUri = returnUrl.startsWith('http') ? returnUrl : `${window.location.origin}${returnUrl}`;
    void this.authService.login(redirectUri);
  }

  protected logout(): void {
    void this.authService.logout();
  }
}
