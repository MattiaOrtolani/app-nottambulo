# Backend

## Stack

- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- Spring Security
- OAuth2 Resource Server
- Maven
- PostgreSQL

## Responsabilita'

Il backend espone API REST per:

- consultazione pubblica dei locali
- gestione amministrativa dei locali
- integrazione con autenticazione JWT emessa da Keycloak

## Struttura principale

- `backend/src/main/java/com/ortocani/backend/controller`
  Endpoint REST pubblici e amministrativi.

- `backend/src/main/java/com/ortocani/backend/service`
  Logica applicativa e ricerca dei locali vicini con formula Haversine.

- `backend/src/main/java/com/ortocani/backend/repository`
  Repository JPA per l'accesso al database.

- `backend/src/main/java/com/ortocani/backend/entity`
  Modello persistente del dominio.

- `backend/src/main/java/com/ortocani/backend/dto`
  DTO per richieste, aggiornamenti, ricerca e risposte API.

- `backend/src/main/java/com/ortocani/backend/security`
  Conversione del token JWT e lettura dei realm roles di Keycloak.

- `backend/src/main/java/com/ortocani/backend/config`
  Configurazione sicurezza, CORS e proprieta' applicative.

- `backend/src/main/java/com/ortocani/backend/exception`
  Gestione centralizzata degli errori.

## Endpoint principali

Pubblici:

- `GET /api/locali`
- `GET /api/locali/{id}`
- `GET /api/locali/nearby?lat={lat}&lon={lon}`

Protetti admin:

- `POST /api/admin/locali`
- `PUT /api/admin/locali/{id}`
- `DELETE /api/admin/locali/{id}`

## Sicurezza

Il backend e' configurato come resource server JWT:

- `/actuator/health` pubblico
- `/api/locali/**` pubblico in lettura
- `/api/admin/**` accessibile solo a utenti autenticati con ruolo `admin`

I ruoli vengono estratti dal token Keycloak leggendo `realm_access.roles`.

## Configurazione

File principale:

- `backend/src/main/resources/application.yml`

Valori importanti via environment:

- `SPRING_DATASOURCE_URL`
- `SPRING_DATASOURCE_USERNAME`
- `SPRING_DATASOURCE_PASSWORD`
- `KEYCLOAK_AUTH_URL`
