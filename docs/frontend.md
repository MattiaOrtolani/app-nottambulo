# Frontend

## Stack

- Angular
- TypeScript
- SCSS
- keycloak-js

## Responsabilita'

Il frontend offre due aree principali:

- area pubblica per la ricerca dei locali vicini
- area amministrativa per creare, modificare ed eliminare locali

## Struttura principale

- `frontend/src/app/pages`
  Pagine principali dell'applicazione.

- `frontend/src/app/components`
  Componenti riutilizzabili come card, form di ricerca e form admin.

- `frontend/src/app/services`
  Servizi Angular per il dialogo con il backend REST.

- `frontend/src/app/models`
  Modelli TypeScript dei dati applicativi.

- `frontend/src/app/auth`
  Integrazione con Keycloak, login, logout e gestione token.

- `frontend/src/app/guards`
  Protezione delle rotte amministrative.

- `frontend/src/app/core`
  Componenti globali dell'interfaccia, come la shell applicativa.

- `frontend/src/environments`
  Configurazioni ambiente per API backend e parametri Keycloak.

## Routing

Rotte previste:

- `/`
- `/nearby`
- `/login`
- `/admin`
- `/admin/locali`

## Integrazione backend

Il service frontend chiama il backend tramite:

- `getNearby(lat, lon)`
- `getAll()`
- `getById(id)`
- `createLocale()`
- `updateLocale()`
- `deleteLocale()`

## Integrazione Keycloak

L'autenticazione e' gestita con:

- un servizio `AuthService` per inizializzazione, login, logout e refresh token
- una `adminGuard` per proteggere le rotte admin
- un interceptor HTTP per allegare il bearer token alle chiamate protette

## Configurazione

File principali:

- `frontend/src/environments/environment.ts`
- `frontend/src/environments/environment.development.ts`

Valori da configurare:

- URL backend
- URL Keycloak
- realm
- clientId del frontend
