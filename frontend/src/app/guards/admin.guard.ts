import { CanActivateFn, Router } from '@angular/router';
import { inject } from '@angular/core';
import { AuthService } from '../auth/auth.service';

export const adminGuard: CanActivateFn = (_, state) => {
	const authService = inject(AuthService);
	const router = inject(Router);
	if (!authService.isAuthenticated() || authService.getRole() !== 'ADMIN') {
		return router.createUrlTree(['/login'], { queryParams: { returnUrl: state.url } });
	}
	return true;
};
