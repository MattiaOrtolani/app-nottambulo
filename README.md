![Nottambulo Banner](image/nottambulo_banner.jpg)

> Piattaforma full stack per cercare locali notturni nelle vicinanze e gestirli tramite backoffice amministrativo protetto.

## Motivazione del progetto

Il progetto nasce con l'obiettivo di realizzare un'applicazione distribuita moderna che unisca:

- consultazione pubblica dei locali in sola lettura
- gestione amministrativa autenticata tramite Keycloak
- backend API strutturato e pronto per essere esteso
- frontend web separato e integrato con il backend
- deploy containerizzato e pensato per Kubernetes

## Strumenti utilizzati

- Backend: Java 17, Spring Boot, Spring Security, Spring Data JPA, Maven
- Frontend: Angular, TypeScript, SCSS, keycloak-js
- Database: PostgreSQL
- Autenticazione: Keycloak
- Container e deploy: Docker, Kubernetes, Argo CD
- CI/CD: GitHub Actions, GitHub Container Registry

## Documentazione

- [Panoramica generale](docs/index.md)
- [Documentazione backend](docs/backend.md)
- [Documentazione frontend](docs/frontend.md)
- [Documentazione Kubernetes](docs/k8s.md)

## Configurazione ambiente

Il backend legge le seguenti variabili (con valori di default indicati in `backend/src/main/resources/application.yml`) per puntare a DB, Keycloak e definire il ruolo admin:

| Variabile | Descrizione | Default |
| --- | --- | --- |
| `SPRING_DATASOURCE_URL` | URL JDBC per PostgreSQL | `jdbc:postgresql://localhost:5432/appdb` |
| `SPRING_DATASOURCE_USERNAME` / `PASSWORD` | Credenziali DB | `postgres` |
| `DB_HOST`, `DB_PORT`, `DB_NAME` | Override per host/porta/nome, usati da `SPRING_DATASOURCE_URL` | `localhost`, `5432`, `appdb` |
| `KEYCLOAK_AUTH_URL` | Issuer URI di Keycloak | `http://localhost:8081/realms/app-nottambulo` |
| `app.security.admin-role` | Nome del ruolo admin atteso nei token | `admin` |

Il frontend (vedi `frontend/src/environments/environment*.ts`) punta per default a `http://localhost:8080/api` e `http://localhost:8081` per backend e Keycloak; basta cambiare quei file o configurare la build Angular per usare valori diversi quando schieri su cluster esterni.

## Flusso cloud

<p align="center">
  <img src="image/cluster-app-nottambulo.svg" alt="Flusso del cluster Nottambulo" />
</p>

## Avvio rapido

Per il deploy Kubernetes i `Secret` demo sono gia inclusi nei manifest YAML del repository.

Workflow locale consigliato:

1. build immagini locali con `./scripts/build-local-images.sh`
2. applica i manifest locali con `./scripts/apply-k8s-local.sh`
3. popola il database con `./scripts/seed-locali.sh`
4. avvia tutto con `./scripts/port-forward-local.sh` per esporre i servizi in locale

> Nota: non è obbligatorio usare la `build-local-images` quando stai deployando su un cluster che punta alle immagini in GitHub Container Registry. I manifest di produzione fanno riferimento alle immagini già buildate e pubblicate, quindi puoi saltare la fase di build locale e usare direttamente quelle remote.

## Utility di sviluppo

- `./scripts/port-forward-local.sh`: crea port-forward per backend (8080), frontend (80) e Postgres (5432) nel namespace `app-nottambulo`; aggiunge anche Keycloak se rilevato, e permette di accedere ai servizi con `http://localhost:{porta}`. Anche `NAMESPACE`, `KEYCLOAK_NAMESPACE` e le porte possono essere sovrascritti via variabili.
- `./scripts/refresh-frontend-local.sh`: ricostruisce l’immagine Angular (`app-nottambulo-frontend:local`) dentro Minikube e la applica all Deployment `frontend` per testare rapidamente cambi stilistici/locali senza ricorriere a pipeline esterne.
- `./scripts/seed-locali-lombardia-300.sh`: esegue lo script SQL con 300 locali demo dentro il pod PostgreSQL nel namespace configurato; utile per ripopolare i dati dopo un reset. Il file `scripts/seed-locali-lombardia-300.sql` definisce gli insert e può essere adattato per altri dataset.
