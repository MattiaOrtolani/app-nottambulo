import { Injectable, signal } from '@angular/core';

@Injectable({
	providedIn: 'root',
})
export class MobileMenuService {
	private readonly menuOpenSignal = signal(false);
	readonly menuOpen = this.menuOpenSignal;

	open(): void {
		this.menuOpenSignal.set(true);
	}

	close(): void {
		this.menuOpenSignal.set(false);
	}

	toggle(): void {
		this.menuOpenSignal.update((current) => !current);
	}
}
