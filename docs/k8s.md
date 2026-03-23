# Kubernetes

## Obiettivo

La cartella `k8s/` contiene i manifest per il deploy del progetto in cluster Kubernetes con supporto GitOps tramite Argo CD.

## Struttura principale

- `k8s/base/`
  Risorse comuni dell'applicazione: namespace, postgres, backend, frontend e ingress.

- `k8s/overlays/local/`
  Overlay locale con immagini Docker `:local` e `imagePullPolicy: Never`.

- `k8s/overlays/prod/`
  Overlay usato da Argo CD in produzione.

- `k8s/argocd/`
  Manifest `Application` di Argo CD.

## Organizzazione del deploy

Componenti previsti nel cluster:

- frontend Angular servito via nginx
- backend Spring Boot esposto internamente
- PostgreSQL con volume persistente
- Keycloak gia presente nel cluster

## Convenzioni adottate

- namespace: `app-nottambulo`
- service interni di tipo `ClusterIP`
- nomi chiari e coerenti per deployment e service
- `Secret` Kubernetes dichiarati direttamente nei manifest YAML
- configurazioni non sensibili in `ConfigMap`

## GitOps

Argo CD punta alla cartella Kubernetes del repository per sincronizzare lo stato del cluster con lo stato dichiarato nel repository.

## Overlay immagini

La cartella `k8s/` e' ora organizzata con Kustomize:

- `k8s/base/` contiene la base comune
- `k8s/overlays/prod/` usa le immagini GHCR ed e' il target di Argo CD
- `k8s/overlays/local/` sostituisce le immagini con tag locali e imposta `imagePullPolicy: Never`

Workflow locale consigliato:

- build immagini locali con `scripts/build-local-images.sh`
- applica i manifest locali con `scripts/apply-k8s-local.sh`

Workflow GitOps/prod:

- fai push sul repository
- Argo CD continua a usare `k8s/overlays/prod/`

## Seed dati demo

Per popolare PostgreSQL con dati demo in cluster:

- esegui `scripts/seed-locali-lombardia-300.sh`
- oppure usa `scripts/seed-locali.sh`

Lo script:

- svuota la tabella `locali`
- reinizializza gli ID
- inserisce 300 locali demo utili per test mappa e nearby API

## Evoluzioni possibili

- separazione `base/` e `overlays/`
- aggiunta di `kustomization.yaml`
- gestione ambienti multipli come dev, test e prod
- integrazione con secret manager esterno
