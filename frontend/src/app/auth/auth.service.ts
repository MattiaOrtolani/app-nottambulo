import { Injectable, signal } from '@angular/core';
import Keycloak, { KeycloakProfile } from 'keycloak-js';
import { environment } from '../../environments/environment';

@Injectable({
	providedIn: 'root',
})
export class AuthService {
	private keycloak?: Keycloak;
	private initialized = false;

	readonly authenticated = signal(false);
	readonly isAdmin = signal(false);
	readonly profile = signal<KeycloakProfile | null>(null);

	async initialize(): Promise<void> {
		if (this.initialized) {
			return;
		}

		try {
			this.keycloak = new Keycloak({
				url: environment.keycloak.url,
				realm: environment.keycloak.realm,
				clientId: environment.keycloak.clientId,
			});

			const authenticated = await this.keycloak.init({
				onLoad: 'check-sso',
				pkceMethod: 'S256',
				checkLoginIframe: false,
				silentCheckSsoRedirectUri: `${window.location.origin}/silent-check-sso.html`,
			});

			this.authenticated.set(authenticated);
			this.isAdmin.set(this.keycloak.hasRealmRole('admin'));

			if (authenticated) {
				this.profile.set(await this.keycloak.loadUserProfile());
			}
		} catch (error) {
			console.error('Keycloak initialization failed', error);
			this.authenticated.set(false);
			this.isAdmin.set(false);
			this.profile.set(null);
		}

		this.initialized = true;
	}

	async login(redirectUri?: string): Promise<void> {
		await this.keycloak?.login({
			redirectUri: redirectUri ?? window.location.href,
		});
	}

	async logout(): Promise<void> {
		await this.keycloak?.logout({
			redirectUri: window.location.origin,
		});
		this.authenticated.set(false);
		this.isAdmin.set(false);
		this.profile.set(null);
	}

	async getValidToken(): Promise<string | undefined> {
		if (!this.keycloak || !this.authenticated()) {
			return undefined;
		}

		await this.keycloak.updateToken(30);
		return this.keycloak.token;
	}
}
