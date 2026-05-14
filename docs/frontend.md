# Frontend

Frontend Angular con autenticazione custom verso il backend.

Flusso:
1. Login su `/login` con username/password.
2. `AuthService` chiama `POST /api/auth/login`.
3. Token JWT salvato in localStorage.
4. `auth.interceptor` aggiunge `Authorization: Bearer <token>` alle chiamate API backend.
5. `admin.guard` consente l'accesso alle rotte admin solo a utenti autenticati con ruolo `ADMIN`.
