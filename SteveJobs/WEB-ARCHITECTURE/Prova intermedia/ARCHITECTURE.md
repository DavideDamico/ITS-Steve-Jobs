# Architettura del Progetto - PhotoGallery Microservices Light

## 📐 Panoramica Architettura (Versione Semplificata)

```
┌─────────────────────────────────────────────────────────────┐
│                         CLIENT                              │
│              (Browser, Postman, Mobile App)                 │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           │ HTTP Requests
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    API GATEWAY :3000                        │
│              (Single Entry Point & Routing)                 │
└─────────────┬──────────────┬──────────────┬─────────────────┘
              │              │              │
              │              │              │
              ▼              ▼              ▼
         ┌────────┐     ┌────────┐     ┌────────┐
         │  USER  │     │ ALBUM  │     │ IMAGE  │
         │  :3002 │     │ :3003  │     │ :3004  │
         └───┬────┘     └───┬────┘     └───┬────┘
             │              │              │
             └──────────────┴──────────────┘
                           │
                           ▼
                  ┌────────────────────┐
                  │   DATA STORAGE     │
                  │   (JSON Files)     │
                  │   users.json       │
                  │   albums.json      │
                  │   images.json      │
                  └────────────────────┘
```

---

## 🤔 Perché un API Gateway? Perché il Pattern Proxy?

### Il Problema Senza Gateway

Immagina se ogni client dovesse conoscere gli indirizzi di tutti i servizi:

```
❌ SENZA GATEWAY (Caos!)

Mobile App deve conoscere:
- http://server:3002 per utenti
- http://server:3003 per album  
- http://server:3004 per immagini

Web App deve conoscere:
- http://server:3002 per utenti
- http://server:3003 per album
- http://server:3004 per immagini

Problemi:
- Se cambia porta/indirizzo → Aggiorna TUTTI i client
- CORS da configurare su OGNI servizio
- Autenticazione da duplicare su OGNI servizio
- Client esposti a complessità interna
```

### La Soluzione: API Gateway

```
✅ CON GATEWAY (Ordine!)

TUTTI i client conoscono SOLO:
- http://server:3000 (il gateway)

Il Gateway sa internamente dove instradare:
- /api/users/*   → User Service (3002)
- /api/albums/*  → Album Service (3003)
- /api/images/*  → Image Service (3004)

Vantaggi:
- Un solo punto di accesso per i client
- Cambi interni invisibili ai client
- CORS configurato solo sul gateway
- Autenticazione centralizzata (futuro)
```

### Perché Ogni Servizio Resta Indipendente?

Anche se tutti passano dal Gateway, ogni servizio è **autonomo e indipendente**:

#### 1️⃣ **Deploy Indipendente**
```javascript
// Posso aggiornare solo Album Service
// senza toccare User Service o Image Service
pm2 restart album-service  // Solo questo!
```

#### 2️⃣ **Scaling Selettivo**
```javascript
// Se tante immagini → Scale solo Image Service
pm2 scale image-service 5  // 5 istanze solo di questo
pm2 scale user-service 1   // Gli altri restano 1
```

#### 3️⃣ **Tecnologie Diverse**
```javascript
// Ogni servizio può usare stack diverso
User Service    → Node.js + JSON
Album Service   → Node.js + PostgreSQL
Image Service   → Go + MongoDB + Redis
// Il Gateway non cambia!
```

#### 4️⃣ **Failure Isolation**
```javascript
// Se Image Service crasha:
✅ User Service continua a funzionare
✅ Album Service continua a funzionare
❌ Solo le immagini non funzionano

// Con monolite tutto si ferma!
```

#### 5️⃣ **Team Indipendenti**
```javascript
Team A → User Service
Team B → Album Service  
Team C → Image Service

// Lavorano in parallelo senza conflitti
// Ogni team ha il suo repository
// Deploy quando pronti, non quando sono pronti TUTTI
```

### Come Funziona il Proxy Pattern?

Il Gateway usa **http-proxy-middleware** per fare da "postino intelligente":

```javascript
// gateway/src/index.js

// Il client chiama:
GET http://localhost:3000/api/users/123

// Il Gateway intercetta e inoltra:
app.use('/api/users', createProxyMiddleware({
  target: 'http://localhost:3002',  // Invia qui
  changeOrigin: true
}));

// Diventa:
GET http://localhost:3002/api/users/123

// Risposta torna indietro attraverso il gateway
User Service → Gateway → Client
```

**Il client NON sa che esistono più servizi!** Pensa sia tutto un'unica applicazione.

### Analogia del Mondo Reale

```
� AZIENDA CON REPARTI

Gateway = Receptionist
- Cliente chiama: "Voglio info sui prodotti"
- Receptionist trasferisce a: Reparto Vendite
- Cliente NON conosce numero diretto del reparto
- Se Reparto Vendite cambia ufficio, cliente non se ne accorge

Servizi = Reparti Specializzati
- Vendite (User Service)
- Magazzino (Album Service)
- Spedizioni (Image Service)

Ogni reparto:
- Ha proprie responsabilità
- Lavora indipendentemente
- Può riorganizzarsi internamente
- Ma cliente passa sempre da receptionist
```

### Vantaggi del Gateway in Questo Progetto

| Senza Gateway | Con Gateway |
|---------------|-------------|
| Client conosce 3 URL | Client conosce 1 URL |
| CORS su 3 servizi | CORS solo su gateway |
| Client sa struttura interna | Client ignaro di architettura |
| Cambio porta = Cambio client | Cambio porta = Cambio gateway |
| 3 punti di fallimento | 1 punto centralizzato |

### In Produzione: Ancora Più Potente

```
                    Internet
                       ↓
                [Load Balancer]
                       ↓
            ┌──────────┼──────────┐
            ↓          ↓          ↓
      [Gateway-1] [Gateway-2] [Gateway-3]
            ↓          ↓          ↓
    ┌───────┴──────────┴──────────┘
    ↓          ↓          ↓
[User×3]  [Album×5]  [Image×10]  ← Istanze multiple

- Gateway replicato per alta disponibilità
- Servizi scalati secondo necessità
- Image Service con 10 istanze (molto usato)
- User Service con 3 istanze (meno usato)
```

---

## �🏗️ Componenti Core (4 Microservizi)

### 1. API Gateway (porta 3000) ✅

**Ruolo**: "Postino Intelligente" - Riceve e instrada richieste

**Responsabilità**:
- Punto di ingresso unico per tutti i client
- Routing delle richieste ai 3 microservizi
- Gestione errori di proxy
- Health check centralizzato

**Tecnologie**:
- Express.js
- http-proxy-middleware (per proxy reverso)
- CORS (Cross-Origin Resource Sharing)

**Endpoints**:
- `GET /health` - Health check gateway
- `GET /services` - Info servizi disponibili
- `/api/users/*` → User Service
- `/api/albums/*` → Album Service
- `/api/images/*` → Image Service

**Evoluzione Futura**:
- Autenticazione JWT middleware
- Rate limiting
- Logging centralizzato
- Caching

---

### 2. User Service (porta 3002) ✅ COMPLETO

**Responsabilità**:
- CRUD completo utenti
- Gestione profili
- Hash password con bcrypt
- Validazione dati utente
- Esempio di riferimento per gli studenti

**Storage**:
- `data/users.json`
- Pattern DAO per facile migrazione a MySQL

**Endpoints**:
```
POST   /api/users          # Crea utente
GET    /api/users          # Lista utenti
GET    /api/users/:id      # Singolo utente
PUT    /api/users/:id      # Aggiorna utente
DELETE /api/users/:id      # Elimina utente
```

**Struttura**:
- `userDAO.js` - Data Access Layer (interazione con JSON)
- `userController.js` - Business Logic (validazione, trasformazioni)
- `routes/index.js` - Route definitions

**Evoluzione Futura**:
- Migrazione MySQL (cambia solo DAO!)
- Ricerca avanzata
- Paginazione

---

### 3. Album Service (porta 3003) 📝 DA IMPLEMENTARE

**Responsabilità**:
- CRUD album fotografici
- Gestione visibilità pubblico/privato
- Controllo proprietà
- Conteggio immagini per album

**Storage**:
- `data/albums.json`
**Endpoints (DA IMPLEMENTARE - CONSEGNA 1)**:
```
POST   /api/albums             # Crea album
GET    /api/albums             # Lista album pubblici
GET    /api/albums/:id         # Singolo album
PUT    /api/albums/:id         # Aggiorna album
DELETE /api/albums/:id         # Elimina album
GET    /api/albums/user/:userId # Album di un utente
```

**Logica Business**:
- Tutti gli album pubblici (versione semplificata)
- Album pubblici visibili a tutti
- Album privati visibili solo al proprietario
- Validare che userId esista prima di creare

**Struttura** (da completare):
- `albumDAO.js` - Skeleton con TODO
- `albumController.js` - Skeleton con TODO
- `routes/index.js` - Route già definite

**Evoluzione Futura**:
- Focus su CRUD e relazioni base
- Tag e categorie
- Statistiche album

---

### 4. Image Service (porta 3004) 📝 DA IMPLEMENTARE

**Responsabilità**:
- CRUD immagini
- Gestione metadati (titolo, descrizione, tags)
- Associazione con album
- Contatore visualizzazioni
- Validazione path/URL immagini

**Storage**:
- `data/images.json`

**Endpoints (DA IMPLEMENTARE - CONSEGNA 2)**:
```
POST   /api/images              # Crea immagine
GET    /api/images              # Lista immagini
GET    /api/images/:id          # Singola immagine
PUT    /api/images/:id          # Aggiorna metadati
DELETE /api/images/:id          # Elimina immagine
GET    /api/images/album/:albumId # Immagini di album
POST   /api/images/:id/view     # Incrementa views
```

**Logica Business**:
- Ogni immagine deve appartenere a un album
- Validare che albumId esista
- Contatore `views` inizia a 0
- Tags salvati come array
- imageUrl contiene URL remoto dell'immagine

**Struttura** (da completare):
- `imageDAO.js` - Skeleton con TODO
- `imageController.js` - Skeleton con TODO
- `routes/index.js` - Route già definite

**Evoluzione Futura**:
- Gestione immagini semplifcata via URL
- Generazione thumbnail
- Ottimizzazione immagini
- Ricerca per tags

---

## 🔄 Comunicazione tra Servizi

### Pattern Attuale: Diretto via HTTP

Nella versione light, la comunicazione tra servizi è minimale:

```
Album Service → User Service
  └─ Verificare che userId esista prima di creare album

Image Service → Album Service  
  └─ Verificare che albumId esista prima di creare immagine
```

### Strumenti Utilizzati

- **Axios** - HTTP client per chiamate inter-service
- **httpClient.js** - Utility condivisa per chiamate HTTP
- **Error Handling** - Gestione errori di rete/servizio

### Esempio Comunicazione

```javascript
// In Album Service
const axios = require('axios');
const config = require('../../shared/config');

// Verificare che user esista
const userResponse = await axios.get(
  `${config.services.user}/api/users/${userId}`
);

if (!userResponse.data.success) {
  throw new Error('User not found');
}
```

---
---

## 📁 Storage Layer

### JSON Storage (Fase Corrente)

Tutti i dati sono salvati in file JSON nella cartella `data/`:

```
data/
├── users.json      # Utenti
├── albums.json     # Album
└── images.json     # Immagini
```

**Formato Standard**:
```json
{
  "data": [
    { "id": 1, "...": "..." },
    { "id": 2, "...": "..." }
  ],
  "lastId": 2
}
```

**Vantaggi JSON**:
- ✅ Semplice da debuggare
- ✅ No configurazione database
- ✅ Persistenza dati tra riavvii
- ✅ Ideale per apprendimento

**Limitazioni JSON**:
- ⚠️ Non scalabile per produzione
- ⚠️ No transazioni
- ⚠️ No indici/query complesse
- ⚠️ Performance limitate con tanti dati

### MySQL Storage (Fase 2 - Futura)

Schema SQL disponibile in `sql/schema-light.sql`:

**Tabelle**:
- `users` - Utenti con password hashate
- `albums` - Album con foreign key a users
- `images` - Immagini con foreign key ad albums

**Vantaggi MySQL**:
- ✅ Relazioni e integrità referenziale
- ✅ Query complesse e JOIN
- ✅ Indici per performance
- ✅ Transazioni ACID
- ✅ Scalabilità

**Migrazione**:
Grazie al pattern DAO, migrare è facile:
1. Eseguire `schema-light.sql`
2. Modificare solo i file DAO (non i controller!)
3. Sostituire operazioni JSON con query SQL

---

## 🎨 Pattern e Best Practices

### Pattern DAO (Data Access Object)

**Obiettivo**: Separare logica di accesso dati da business logic

```
Controller (Business Logic)
    ↓
   DAO (Data Access)
    ↓
Storage (JSON/MySQL)
```

**Vantaggi**:
- ✅ Cambio storage senza modificare controller
- ✅ Testing più facile (mock del DAO)
- ✅ Codice più pulito e manutenibile
- ✅ Riutilizzo logica accesso dati

**Esempio**:
```javascript
// DAO - Accede ai dati
class UserDAO {
  async findById(id) {
    // Oggi: legge da JSON
    // Domani: query SQL
    return user;
  }
}

// Controller - Business logic
async function getUser(req, res) {
  const user = await userDAO.findById(req.params.id);
  // Validazioni, trasformazioni, risposte
  res.json({ success: true, data: user });
}
```

### Separation of Concerns

Ogni file ha una responsabilità chiara:

- **routes/index.js** - Definisce URL e verbi HTTP
- **controller.js** - Validazione, logica business, risposte
- **DAO.js** - Solo accesso dati (CRUD operations)
- **models/** - Struttura e validazione dati
- **utils/** - Funzioni riutilizzabili

### Error Handling Centralizzato

```javascript
// Wrap async functions
const asyncHandler = require('../../shared/utils/errorHandler');

router.get('/albums/:id', asyncHandler(async (req, res) => {
  // Se errore, asyncHandler lo cattura automaticamente
  const album = await albumDAO.findById(req.params.id);
  res.json({ success: true, data: album });
}));
```

### Validazione Input

```javascript
const { validateRequired, validateEmail } = require('../../shared/utils/validator');

// Nel controller
validateRequired(name, 'Name');
validateRequired(userId, 'User ID');
// Lancia errore se validazione fallisce
```

---

## 🔐 Sicurezza

### Password Hashing (User Service)

```javascript
const bcrypt = require('bcrypt');

// Creazione utente
const hashedPassword = await bcrypt.hash(password, 10);

// Login
const isValid = await bcrypt.compare(password, user.password);
```

### Sanitizzazione Dati

- ✅ Validare tutti gli input
- ✅ Non esporre password in risposte
- ✅ Limitare lunghezza stringhe
- ✅ Validare formati (email, etc)

### Evoluzione Futura Sicurezza

- 🔒 JWT per autenticazione stateless
- 🔒 HTTPS in produzione
- 🔒 Rate limiting per prevenire abuse
- 🔒 Input sanitization avanzata
- 🔒 SQL injection prevention (prepared statements)

---

## 🚀 Scalabilità
Client → Gateway → Album Service → Ritorna tutti album
                  ↓                     ↓
                  └─── SUCCESS → JSON response
```

## 📦 Layer Pattern

### Controller Layer
- Riceve richieste HTTP
- Valida input
- Chiama DAO layer
- Formatta risposte
- Gestisce errori

### DAO Layer (Data Access Object)
- Astrazione accesso dati
- Operazioni CRUD
- Validazioni strutturali
- Conversione dati

### Model Layer
- Definizione strutture dati
- Validazioni business logic
- Metodi helper
- Conversioni (toJSON, toSafeObject)

### Utility Layer
- Gestione errori
- Helpers JSON
- Validazioni comuni
- HTTP client per chiamate tra servizi

## 🔐 Sicurezza (Attuale vs Futuro)

### Attuale (Fase 1)
- ✅ Password hashate con bcrypt
- ✅ Validazione input
- ✅ Gestione errori
- ❌ Nessuna autenticazione token
- ❌ Endpoint pubblici

### Futuro (Fase 2+)
- ✅ JWT per autenticazione
- ✅ Middleware di verifica token nel gateway
- ✅ Refresh token
- ✅ Rate limiting
- ✅ HTTPS in produzione
- ✅ Validazione stringente

## 💾 Persistenza Dati

### Fase 1: JSON Files
```javascript
// Struttura file JSON
{
  "data": [
    { id: 1, ...},
    { id: 2, ...}
  ],
  "lastId": 2
}
```

**Pro**:
- Setup immediato
- Nessuna configurazione DB
- Facile debug
- Perfetto per apprendimento

**Contro**:
- Non scalabile
- No transazioni
- No relazioni complesse
- Problemi con accessi concorrenti

### Fase 2: MySQL
```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  ...
);
```

**Vantaggi**:
- Relazioni con foreign keys
- Transazioni ACID
- Query complesse
- Scalabilità
- Integrità dati

**Migrazione**: Cambiare solo i DAO, controller rimangono identici!

## 📈 Scalabilità

### Orizzontale
Ogni microservizio può essere replicato:
```
Gateway → [User Service 1, User Service 2, User Service 3]
       → [Album Service 1, Album Service 2]
       → ...
```

### Verticale
Aumentare risorse per servizi più carichi:
```
Image Service → 4GB RAM, 2 CPU cores
User Service  → 2GB RAM, 1 CPU core
```

### Caching (Futuro)
```
Gateway → Redis Cache → Microservice → Database
```

## 🔍 Monitoring (Futuro)

### Logging
- Winston/Bunyan per log strutturati
- Log aggregation (ELK stack)
- Distributed tracing

### Metriche
- Prometheus per metriche
- Grafana per visualizzazione
- Alert su anomalie

### Health Checks
- Endpoint `/health` per ogni servizio
- Kubernetes liveness/readiness probes

## 🚀 Deployment (Futuro)

### Docker
```dockerfile
# Ogni servizio nel suo container
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]
```

### Docker Compose
```yaml
services:
  gateway:
    build: ./gateway
    ports: ["3000:3000"]
  user-service:
    build: ./services/user-service
    ports: ["3002:3002"]
  # ...
```

### Kubernetes
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: user-service
spec:
  replicas: 3
  # ...
```

## 📚 Best Practices Implementate

1. **Separation of Concerns**: Ogni servizio ha una responsabilità specifica
2. **DRY (Don't Repeat Yourself)**: Codice condiviso in `shared/`
3. **Error Handling**: Gestione centralizzata errori
4. **Validation**: Doppio livello (model + controller)
5. **Security**: Password hashate, input sanitizzato
6. **Scalability**: Architettura pronta per scaling
7. **Maintainability**: Codice ben documentato e strutturato

## 🎯 Conclusione

Questa architettura fornisce:
- ✅ **Modularità**: Servizi indipendenti
- ✅ **Scalabilità**: Pronta per crescere
- ✅ **Manutenibilità**: Codice pulito e organizzato
- ✅ **Testabilità**: Ogni servizio testabile singolarmente
- ✅ **Estensibilità**: Facile aggiungere nuovi servizi
- ✅ **Evoluzione**: Pronta per JWT, DB, Docker, etc.

**Perfetta per l'apprendimento progressivo! 🎓**
