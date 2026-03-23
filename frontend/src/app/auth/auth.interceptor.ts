import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { from } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { AuthService } from './auth.service';

export const authInterceptor: HttpInterceptorFn = (request, next) => {
	const authService = inject(AuthService);

	if (!request.url.includes('/admin/')) {
		return next(request);
	}

	return from(authService.getValidToken()).pipe(
		switchMap((token) => {
			if (!token) {
				return next(request);
			}

			return next(
				request.clone({
					setHeaders: {
						Authorization: `Bearer ${token}`,
					},
				}),
			);
		}),
	);
};
