import { Routes } from '@angular/router';
import { adminGuard } from './guards/admin.guard';

export const routes: Routes = [
	{
		path: '',
		loadComponent: () =>
			import('./pages/landing-page.component').then((module) => module.LandingPageComponent),
	},
	{
		path: 'mappa',
		loadComponent: () =>
			import('./pages/nearby-page.component').then((module) => module.NearbyPageComponent),
	},
	{
		path: 'nearby',
		pathMatch: 'full',
		redirectTo: 'mappa',
	},
	{
		path: 'login',
		loadComponent: () =>
			import('./pages/login-page.component').then((module) => module.LoginPageComponent),
	},
	{
		path: 'admin',
		pathMatch: 'full',
		redirectTo: 'admin/locali',
	},
	{
		path: 'admin/locali',
		loadComponent: () =>
			import('./pages/admin-locali-page.component').then((module) => module.AdminLocaliPageComponent),
		canActivate: [adminGuard],
	},
	{
		path: '**',
		redirectTo: '',
	},
];
