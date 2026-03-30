export interface SiteNavigationLink {
	label: string;
	path: string;
	exact?: boolean;
}

export const NAVIGATION_LINKS: SiteNavigationLink[] = [
	{ label: 'Home', path: '/', exact: true },
	{ label: 'Mappa', path: '/mappa' },
	{ label: 'Admin', path: '/admin/locali' },
];
