# PhotoGallery App - Progetto Microservizi (Versione Light)

## 📋 Descrizione Progetto
Applicazione semplificata di galleria fotografica sviluppata con architettura a microservizi utilizzando Express.js.

**Versione Light**: 4 servizi essenziali per apprendere i concetti fondamentali dei microservizi in tempi ridotti.

## 🎯 Obiettivi Didattici
- Comprendere l'architettura a microservizi
- Implementare API RESTful con Express.js
- Gestire operazioni CRUD complete
- Utilizzare il pattern DAO per astrazione dati
- Preparare il codice per evoluzione (JSON → MySQL)

## ⏱️ Tempo Stimato
**Totale: 10-12 ore** distribuite su 4-5 lezioni

---

## 📂 Struttura Progetto

```
photogallery-microservices/
├── gateway/                  # API Gateway (porta 3000)
├── services/
│   ├── user-service/        # Gestione utenti (porta 3002) ✅ COMPLETO
│   ├── album-service/       # Gestione album (porta 3003) 📝 DA IMPLEMENTARE
│   └── image-service/       # Gestione immagini (porta 3004) 📝 DA IMPLEMENTARE
├── shared/                  # Codice condiviso
│   ├── models/             # Modelli dati (User, Album, Image)
│   ├── config/             # Configurazioni
│   └── utils/              # Utility (errorHandler, validator, jsonHelper)
├── data/                    # Storage JSON (simulazione DB)
│   ├── users.json
│   ├── albums.json
│   └── images.json
└── sql/                     # Script SQL per migrazione futura
```

---

## 🚀 Consegne Graduate

### **CONSEGNA 1 - Album Service (6 ore)**
**Obiettivo**: Implementare gestione completa degli album con visibilità pubblico/privato

**Cosa fare**:
1. Studiare `user-service` come esempio di riferimento
2. Completare `services/album-service/src/dao/albumDAO.js`
3. Completare `services/album-service/src/controllers/albumController.js`
4. Testare tutti gli endpoint con Postman o REST Client

**Endpoints da implementare**:
```
POST   /api/albums              # Crea nuovo album
GET    /api/albums              # Lista tutti gli album pubblici
GET    /api/albums/:id          # Dettaglio album singolo
PUT    /api/albums/:id          # Aggiorna album
DELETE /api/albums/:id          # Elimina album
GET    /api/albums/user/:userId # Lista album di un utente
```

**Logica di business**:
- Tutti gli album sono pubblici (versione semplificata)
- Ogni album appartiene a un userId (validare esistenza utente)
- Focus su CRUD base e relazioni tra entità

**Criteri di successo**:
- [ ] Tutti gli endpoint funzionano
- [ ] Validazione dati corretta
- [ ] Validazione dati (name, userId obbligatori)
- [ ] Gestione errori appropriata
- [ ] Dati salvati correttamente in `data/albums.json`

---

### **CONSEGNA 2 - Image Service (6 ore)**
**Obiettivo**: Implementare gestione immagini con associazione agli album

**Cosa fare**:
1. Completare `services/image-service/src/dao/imageDAO.js`
2. Completare `services/image-service/src/controllers/imageController.js`
3. Implementare logica di conteggio visualizzazioni
4. Testare tutte le funzionalità

**Endpoints da implementare**:
```
POST   /api/images              # Carica nuova immagine
GET    /api/images              # Lista tutte le immagini
GET    /api/images/:id          # Dettaglio immagine
PUT    /api/images/:id          # Aggiorna metadati
DELETE /api/images/:id          # Elimina immagine
GET    /api/images/album/:albumId  # Immagini di un album
POST   /api/images/:id/view     # Incrementa contatore visualizzazioni
```

**Logica di business**:
- Ogni immagine appartiene a un album (validare albumId)
- Contatore `views` parte da 0 e si incrementa
- Salvare: titolo, descrizione, tags, path (URL), albumId
- Validare che l'album esista prima di creare immagine

**Criteri di successo**:
- [ ] CRUD completo funzionante
- [ ] Relazione corretta con album
- [ ] Contatore views funzionante
- [ ] Validazione dati completa
- [ ] Gestione errori appropriata

---

## 📦 Installazione e Avvio

### Setup Iniziale
```bash
# Dalla root del progetto
npm install

# Installare dipendenze di tutti i servizi
npm run install:all
```

### Avvio Servizi
```bash
# Avvia tutti i servizi contemporaneamente
npm run dev:all

# Oppure singolarmente per debug
cd gateway && npm run dev
cd services/user-service && npm run dev
cd services/album-service && npm run dev
cd services/image-service && npm run dev
```

### Verifica Funzionamento
```bash
# Test del gateway
curl http://localhost:3000/health

# Info servizi disponibili
curl http://localhost:3000/services

# Test user service
curl http://localhost:3000/api/users
```

---

## 🔧 Tecnologie Utilizzate

- **Node.js** v18+ 
- **Express.js** 4.x - Framework web
- **http-proxy-middleware** - Gateway routing
- **bcrypt** - Hash password
- **axios** - HTTP client per comunicazione tra servizi
- **dotenv** - Gestione variabili ambiente
- **cors** - Cross-Origin Resource Sharing

---

## 📚 Risorse per Studenti

### File Importanti
- `START_HERE.md` - Punto di partenza consigliato
- `SETUP.md` - Guida setup dettagliata
- `TESTING.md` - Come testare gli endpoint
- `ARCHITECTURE.md` - Spiegazione architettura microservizi
- `api.http` - Esempi richieste REST Client

### Modelli da Studiare
- `shared/models/User.js` - Esempio modello completo
- `shared/models/Album.js` - Da utilizzare nell'implementazione
- `shared/models/Image.js` - Da utilizzare nell'implementazione

### Utility Pronte all'Uso
- `shared/utils/errorHandler.js` - Gestione errori
- `shared/utils/jsonHelper.js` - Operazioni CRUD su JSON
- `shared/utils/validator.js` - Validazioni comuni
- `shared/utils/httpClient.js` - Client per chiamate inter-service

### Servizio di Riferimento
**`services/user-service/`** è completamente implementato.
Studialo prima di iniziare le consegne!

---

## 🎓 Suggerimenti per lo Studio

1. **Inizia dal User Service**: È completo e ben commentato
2. **Usa il pattern DAO**: Separa logica business da accesso dati
3. **Testa frequentemente**: Usa Postman o REST Client dopo ogni funzione
4. **Leggi i commenti TODO**: Contengono hint utili
5. **Sfrutta le utility**: Non reinventare la ruota

## ⚠️ Importante

- ❌ **NO autenticazione JWT** in questa fase (troppo complesso)
- ✅ **Immagini via URL** (no file upload)
- ✅ **SÌ validazione dati** (controlla sempre input utente)
- ✅ **SÌ gestione errori** (usa errorHandler.js)
- ✅ **SÌ JSON storage** (facile da debuggare)

---

## 🚀 Evoluzione Futura (Fase 2)

Dopo aver completato le 2 consegne, il progetto può evolvere:

### Fase 2A - Migrazione Database
- Sostituire JSON con MySQL
- Usare gli script in `sql/schema.sql`
- Il pattern DAO facilita la migrazione (cambi solo il DAO, controller resta uguale!)

### Fase 2B - Autenticazione JWT
- Implementare JWT in tutti i servizi
- Middleware di autenticazione
- Protezione endpoint sensibili

### Fase 2C - Docker
- Containerizzare ogni servizio
- Docker Compose per orchestrazione
- Gestione network isolato

### Fase 2D - Frontend
- React/Vue.js per interfaccia
- Gestione immagini via URL
- Preview e gestione gallery

---

## 📞 Supporto

- Controlla `FAQ.md` per problemi comuni
- Usa i file di test in `api.http` come riferimento

---

## � Licenza

Progetto didattico per ITS - Steve Jobs Academy

**Buon lavoro! 💪**

- **Node.js** v18+
- **Express.js** 4.x
- **Nodemon** (dev)
- **UUID** (generazione ID)
- **Bcrypt** (hash password)
- **Axios** (comunicazione tra servizi)
- **CORS**
- **Multer** (upload file - futuro)

---

## 📝 Note Importanti per gli Studenti

### Pattern DAO
Il progetto usa il pattern **Data Access Object (DAO)** per separare la logica di accesso ai dati:
- Ora: i DAO leggono/scrivono su file JSON
- Futuro: cambierete solo i DAO per usare MySQL, senza toccare i controller!

### Struttura File JSON
I dati sono salvati in `data/` con questo formato:
```json
{
  "users": [...],
  "lastId": 5
}
```

### Comunicazione tra Microservizi
Usare sempre il **gateway** per chiamate esterne.
Per chiamate tra servizi, usare HTTP diretto:
```javascript
const axios = require('axios');
const response = await axios.get('http://localhost:3002/api/users/123');
```

**Buon lavoro! �**


**Buon Lavoro! 🚀**
