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

Per semplificare la consegna, la configurazione demo e' centralizzata nel file `.env`.

1. Copia `.env.example` in `.env` se il file non e' gia presente.
2. Esporta le variabili prima di avviare backend o generare i manifest Kubernetes:
   `set -a && source .env && set +a`
3. Avvia i componenti oppure genera i `Secret` Kubernetes dal file `.env`.

Per i manifest Kubernetes puoi usare lo script:
`./scripts/render-k8s-secrets.sh`

Oppure applicarli direttamente:
`./scripts/render-k8s-secrets.sh | kubectl apply -f -`
