export type LocaleType = 'DISCOTECA' | 'PUB' | 'BAR' | 'LOUNGE' | 'LIVE_CLUB';

export interface Locale {
	id: number;
	nome: string;
	descrizione: string;
	latitudine: number;
	longitudine: number;
	tipo: LocaleType;
	distanzaKm?: number | null;
}

export interface NearbyLocale {
	id: number;
	nome: string;
	latitudine: number;
	longitudine: number;
	tipo: LocaleType;
	distanzaKm?: number | null;
}

export interface CreateLocaleRequest {
	nome: string;
	descrizione: string;
	latitudine: number;
	longitudine: number;
	tipo: LocaleType;
}

export interface UpdateLocaleRequest extends CreateLocaleRequest {}

export const LOCALE_TYPES: LocaleType[] = ['DISCOTECA', 'PUB', 'BAR', 'LOUNGE', 'LIVE_CLUB'];
