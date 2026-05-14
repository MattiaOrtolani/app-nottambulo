# Backend

Backend Spring Boot con Spring Security e JWT interno.

Endpoint pubblici:
- `GET /api/locali/**`
- `POST /api/auth/login`
- `GET /actuator/health`

Endpoint admin:
- `/api/admin/**` richiede token JWT con ruolo `ADMIN`.

Login demo:
- username `admin`
- password `admin`
