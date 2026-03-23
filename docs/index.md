# Documentazione App Nottambulo

Questa cartella raccoglie la documentazione tecnica del progetto suddivisa per area.

## Indice

- [Backend](backend.md)
- [Frontend](frontend.md)
- [Kubernetes](k8s.md)

## Repository structure

Il repository e' organizzato come monorepo:

- `backend/`
  Applicazione Spring Boot con API REST, logica applicativa, sicurezza e accesso al database.

- `frontend/`
  Applicazione Angular per area pubblica e backoffice amministrativo.

- `k8s/`
  Manifest Kubernetes per database, backend, frontend, ingress e Argo CD.

## Obiettivo applicativo

L'applicazione permette di:

- cercare i locali notturni vicini a una posizione GPS
- mostrare i primi 10 risultati ordinati per distanza
- gestire i locali tramite un'area amministrativa protetta

## Integrazioni principali

- il frontend comunica con il backend tramite API REST
- il backend usa PostgreSQL come persistence layer
- Keycloak gestisce autenticazione e ruoli
- Kubernetes ospita i servizi applicativi
- Argo CD gestisce il deploy GitOps
