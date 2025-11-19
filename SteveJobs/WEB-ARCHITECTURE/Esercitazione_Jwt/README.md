# Esercitazione JWT

Applicazione Node.js con autenticazione JWT, gestione utenti e ruoli.

## Setup

1. Installare le dipendenze:
```bash
npm install
```

2. Configurare il database:
   - Creare un database MySQL
   - Eseguire lo script SQL in `sql/schema.sql`

3. Configurare le variabili d'ambiente:
   - Copiare `.env.example` in `.env`
   - Configurare le credenziali del database e la secret key JWT

4. Avviare l'applicazione:
```bash
npm start
```

## Struttura

- `config/` - Configurazione database
- `controllers/` - Logica di business
- `middlewares/` - Middleware di autenticazione e autorizzazione
- `models/` - Modelli e DAO
- `routes/` - Definizione delle route API
- `sql/` - Script SQL per il database
- `utils/` - Utilità varie

## API Endpoints

### Autenticazione
- `POST /api/auth/register` - Registrazione utente
- `POST /api/auth/login` - Login
- `POST /api/auth/logout` - Logout (aggiunge token a blacklist)

### Utenti (richiede autenticazione)
- `GET /api/users` - Lista utenti
- `GET /api/users/:id` - Dettaglio utente
- `PUT /api/users/:id` - Aggiorna utente
- `DELETE /api/users/:id` - Elimina utente (solo ADMIN)
