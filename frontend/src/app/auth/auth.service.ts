import { HttpClient } from '@angular/common/http';
import { Injectable, computed, inject, signal } from '@angular/core';
import { environment } from '../../environments/environment';

interface LoginResponse {
	token: string;
	username: string;
	role: string;
}

@Injectable({ providedIn: 'root' })
export class AuthService {
	private readonly http = inject(HttpClient);
	private readonly tokenSignal = signal<string | null>(localStorage.getItem('auth_token'));
	private readonly roleSignal = signal<string | null>(localStorage.getItem('auth_role'));
	readonly authenticated = computed(() => !!this.tokenSignal());
	readonly isAdmin = computed(() => this.roleSignal() === 'ADMIN');

	login(username: string, password: string) {
		return this.http.post<LoginResponse>(`${environment.apiBaseUrl}/auth/login`, { username, password });
	}

	storeSession(response: LoginResponse): void {
		localStorage.setItem('auth_token', response.token);
		localStorage.setItem('auth_role', response.role);
		this.tokenSignal.set(response.token);
		this.roleSignal.set(response.role);
	}

	logout(): void {
		localStorage.removeItem('auth_token');
		localStorage.removeItem('auth_role');
		this.tokenSignal.set(null);
		this.roleSignal.set(null);
	}

	getToken(): string | null { return this.tokenSignal(); }
	getRole(): string | null { return this.roleSignal(); }
	isAuthenticated(): boolean { return this.authenticated(); }
}
