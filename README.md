# App Nottambulo

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

## Avvio rapido

Per il deploy Kubernetes i `Secret` demo sono gia inclusi nei manifest YAML del repository.

Workflow locale consigliato:

1. build immagini locali con `./scripts/build-local-images.sh`
2. applica i manifest locali con `./scripts/apply-k8s-local.sh`
3. popola il database con `./scripts/seed-locali.sh`
