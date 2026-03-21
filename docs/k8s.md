# Kubernetes

## Obiettivo

La cartella `k8s/` contiene i manifest per il deploy del progetto in cluster Kubernetes con supporto GitOps tramite Argo CD.

## Struttura principale

- `k8s/namespace.yaml`
  Namespace dell'applicazione.

- `k8s/postgres/`
  Risorse del database PostgreSQL:
  secret, pvc, deployment, service.

- `k8s/backend/`
  Risorse del backend:
  configmap, secret, deployment, service.

- `k8s/frontend/`
  Risorse del frontend:
  deployment e service.

- `k8s/ingress/`
  Ingress applicativo per frontend, backend e Keycloak.

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
- configurazioni sensibili centralizzate in `.env` e riversate nei `Secret`
- configurazioni non sensibili in `ConfigMap`

## Secret demo

Per semplificare l'avvio del progetto:
- i valori demo di username e password sono raccolti nel file `.env`
- i manifest `k8s/backend/secret.yaml` e `k8s/postgres/secret.yaml` usano placeholder `${...}`
- lo script `scripts/render-k8s-secrets.sh` legge `.env` e produce i `Secret` pronti per `kubectl apply`

## GitOps

Argo CD punta alla cartella Kubernetes del repository per sincronizzare lo stato del cluster con lo stato dichiarato nel repository.

## Evoluzioni possibili

- separazione `base/` e `overlays/`
- aggiunta di `kustomization.yaml`
- gestione ambienti multipli come dev, test e prod
- integrazione con secret manager esterno
