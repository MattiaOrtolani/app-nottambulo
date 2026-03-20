import { Component, inject } from '@angular/core';
import { NgIf } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';
import { AuthService } from '../auth/auth.service';

@Component({
  selector: 'app-shell-header',
  standalone: true,
  imports: [NgIf, RouterLink, RouterLinkActive],
  template: `
    <header class="page shell-header">
      <div class="brand panel">
        <div>
          <p class="eyebrow">App nottambulo</p>
          <a routerLink="/" class="brand-link">Trova la tua prossima notte</a>
        </div>

        <nav class="nav">
          <a routerLink="/" routerLinkActive="active" [routerLinkActiveOptions]="{ exact: true }">Home</a>
          <a routerLink="/nearby" routerLinkActive="active">Vicini a me</a>
          <a routerLink="/admin/locali" routerLinkActive="active">Backoffice</a>
        </nav>

        <div class="actions">
          <span *ngIf="authService.authenticated()" class="welcome">
            {{ authService.profile()?.firstName || authService.profile()?.username || 'Admin' }}
          </span>
          <button *ngIf="!authService.authenticated()" class="ghost-button" (click)="login()">Login</button>
          <button *ngIf="authService.authenticated()" class="ghost-button" (click)="logout()">Logout</button>
        </div>
      </div>
    </header>
  `,
  styles: [`
    .shell-header {
      position: sticky;
      top: 0;
      z-index: 5;
      padding: 1rem 1.25rem 0;
    }

    .brand {
      display: grid;
      gap: 1rem;
      align-items: center;
      padding: 1rem 1.25rem;
      grid-template-columns: 1.3fr 1fr auto;
    }

    .eyebrow {
      margin: 0 0 0.25rem;
      text-transform: uppercase;
      letter-spacing: 0.2rem;
      font-size: 0.72rem;
      color: var(--muted);
    }

    .brand-link {
      font-size: 1.35rem;
      font-weight: 700;
    }

    .nav {
      display: flex;
      gap: 1rem;
      justify-content: center;
      flex-wrap: wrap;
    }

    .nav a {
      padding: 0.55rem 0.9rem;
      border-radius: 999px;
      color: var(--muted);
    }

    .nav a.active {
      color: var(--accent-dark);
      background: rgba(255, 215, 199, 0.8);
    }

    .actions {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      justify-content: flex-end;
    }

    .welcome {
      font-size: 0.92rem;
      color: var(--muted);
    }

    @media (max-width: 960px) {
      .brand {
        grid-template-columns: 1fr;
      }

      .actions,
      .nav {
        justify-content: flex-start;
      }
    }
  `]
})
export class ShellHeaderComponent {
  protected readonly authService = inject(AuthService);

  protected login(): void {
    void this.authService.login();
  }

  protected logout(): void {
    void this.authService.logout();
  }
}
