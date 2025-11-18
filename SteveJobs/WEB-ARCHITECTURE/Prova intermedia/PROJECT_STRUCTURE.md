# Struttura File Progetto - Versione Light

## 📂 Panoramica Struttura

```
photogallery-microservices/
│
├── 📄 README.md                    # 👈 INIZIA DA QUI! Consegne e obiettivi
├── 📄 START_HERE.md                # Benvenuto e quick start
├── 📄 SETUP.md                     # Guida setup passo-passo
├── 📄 TESTING.md                   # Come testare gli endpoint
├── 📄 CHECKLIST.md                 # Traccia il tuo progresso
├── 📄 FAQ.md                       # Problemi comuni e soluzioni
├── 📄 ARCHITECTURE.md              # Architettura dettagliata
├── 📄 PROJECT_STRUCTURE.md         # 👈 Questo file!
├── 📄 POSTMAN.md                   # Guida Postman
├── 📄 api.http                     # Test REST Client (40+ esempi)
│
├── 📄 package.json                 # Dipendenze root + script avvio
├── 📄 .env.example                 # Template variabili ambiente
├── 📄 .gitignore                   # File da ignorare in git
│
├── 📁 gateway/                     # ✅ API Gateway (porta 3000)
│   ├── package.json
│   └── src/
│       └── index.js                # Routing verso i 3 servizi
│
├── 📁 services/                    # 🔧 I 3 Microservizi
│   │
│   ├── 📁 user-service/            # ✅ User Service (porta 3002) - COMPLETO
│   │   ├── package.json
│   │   └── src/
│   │       ├── index.js            # Server Express
│   │       ├── controllers/
│   │       │   └── userController.js    # ✅ ESEMPIO COMPLETO - Studialo!
│   │       ├── dao/
│   │       │   └── userDAO.js           # ✅ Pattern DAO implementato
│   │       └── routes/
│   │           └── index.js             # Route definitions
│   │
│   ├── 📁 album-service/           # 📝 Album Service (porta 3003) - DA IMPLEMENTARE
│   │   ├── package.json
│   │   └── src/
│   │       ├── index.js            # Server Express (pronto)
│   │       ├── controllers/
│   │       │   └── albumController.js   # 📝 TODO: CONSEGNA 1 (6 ore)
│   │       ├── dao/
│   │       │   └── albumDAO.js          # � TODO: Implementare CRUD
│   │       └── routes/
│   │           └── index.js             # Route già definite
│   │
│   └── 📁 image-service/           # 📝 Image Service (porta 3004) - DA IMPLEMENTARE
│       ├── package.json
│       └── src/
│           ├── index.js            # Server Express (pronto)
│           ├── controllers/
│           │   └── imageController.js   # 📝 TODO: CONSEGNA 2 (6 ore)
│           ├── dao/
│           │   └── imageDAO.js          # 📝 TODO: Implementare CRUD
│           └── routes/
│               └── index.js             # Route già definite
│
├── 📁 shared/                      # 🔧 Librerie Condivise (Pronte all'uso!)
│   ├── 📁 config/
│   │   ├── index.js                # Porte, URL servizi, CORS config
│   │   └── database.js             # Config MySQL (per Fase 2)
│   │
│   ├── 📁 models/                  # 📦 Modelli Dati (Da usare!)
│   │   ├── User.js                 # ✅ Modello Utente (completo)
│   │   ├── Album.js                # ✅ Modello Album (usa questo!)
│   │   └── Image.js                # ✅ Modello Immagine (usa questo!)
│   │
│   │   └── index.js                # Export tutti i modelli
│   │
│   └── 📁 utils/                   # Utility comuni
│       ├── errorHandler.js         # Gestione errori centralizzata
│       ├── jsonHelper.js           # Helper per file JSON
│       ├── validator.js            # Validazioni comuni
│       └── httpClient.js           # Client HTTP per chiamate tra servizi
│
├── 📁 data/                        # Storage JSON (simula database)
│   ├── README.md                   # Documentazione data
│   ├── users.json                  # Dati utenti
│   ├── albums.json                 # Dati album
│   ├── images.json                 # Dati immagini

│   └── favorites.json              # Dati preferiti
│
└── 📁 sql/                         # Script database (per futuro)
    ├── README.md                   # Documentazione SQL
    ├── schema.sql                  # Schema completo database MySQL
    └── seed-data.sql               # Dati di esempio per MySQL
```

## 📝 Legenda Colori Emoji

- 📄 File di documentazione o configurazione
│   └── 📁 utils/                   # 🛠️ Utility (Pronte all'uso!)
│       ├── errorHandler.js         # ✅ Wrapper async + error middleware
│       ├── jsonHelper.js           # ✅ CRUD operations su JSON
│       ├── validator.js            # ✅ Validazioni (email, required, etc)
│       └── httpClient.js           # ✅ Client per chiamate inter-service
│
├── 📁 data/                        # 💾 Storage JSON (3 file)
│   ├── README.md                   # Info storage
│   ├── users.json                  # ✅ Dati utenti
│   ├── albums.json                 # 📝 Dati album (si popola con CONSEGNA 1)
│   └── images.json                 # 📝 Dati immagini (si popola con CONSEGNA 2)
│
├── 📁 sql/                         # 🗃️ Schema Database (Per Fase 2)
│   ├── README.md                   # Info migrazione DB
│   ├── schema-light.sql            # ✅ Schema semplificato (3 tabelle)
│   ├── schema.sql                  # Schema completo (5 tabelle)
│   └── seed-data.sql               # Dati di esempio
│
# Directory uploads rimossa - immagini gestite via URL
    └── .gitkeep                    # Mantiene cartella in git
```

---

## 🔍 Legenda Simboli

- � File documentazione
- 📁 Cartella/Directory
- ✅ File completo e funzionante
- 📝 File con TODO da implementare
- 🔧 Utility/Tool pronto all'uso
- 📦 Modello dati
- 💾 Storage dati
- 🗃️ Database

---

## 🎯 File Chiave da Conoscere

### 🚀 Per Iniziare (Priorità Alta)

1. **START_HERE.md** - 👈 Benvenuto e motivazione
2. **README.md** - 👈 Consegne dettagliate (2 consegne)
3. **SETUP.md** - Come installare e avviare tutto
4. **services/user-service/** - 👈 ESEMPIO COMPLETO da studiare!

### 📚 Durante il Lavoro

5. **shared/models/** - Modelli Album e Image da usare
6. **shared/utils/** - 4 utility già pronte (usa queste!)
7. **api.http** - 40+ esempi di richieste per testare
8. **CHECKLIST.md** - Traccia il tuo progresso

### 🆘 Quando Hai Problemi

9. **FAQ.md** - Problemi comuni e soluzioni
10. **TESTING.md** - Come testare correttamente
11. **ARCHITECTURE.md** - Capire come funziona tutto

### �‍🏫 Per Docenti

12. **DOCENTE.md** - Rubrica valutazione, troubleshooting
13. **SEMPLIFICAZIONE.md** - Cosa è cambiato nella versione light

---

## 📊 Statistiche Progetto Light

- **Microservizi**: 4 (Gateway + 3 servizi)
- **Consegne**: 2 (Album + Image)
- **Endpoints totali**: ~20
- **Modelli dati**: 3 (User, Album, Image)
- **Utility condivise**: 4
- **File documentazione**: 11
- **File sorgente**: ~30
- **Righe di codice**: ~3500
- **Tempo stimato**: 10-12 ore

---

## 🔧 File di Configurazione Importanti

### package.json (Root)
```json
{
  "scripts": {
    "install:all": "...",  // Installa tutte le dipendenze
    "dev:all": "...",      // Avvia tutti i servizi
    "dev:gateway": "...",  // Solo gateway
    "dev:users": "...",    // Solo user service
    "dev:albums": "...",   // Solo album service
    "dev:images": "..."    // Solo image service
  }
}
```

### shared/config/index.js
- Porte dei servizi (3000, 3002, 3003, 3004)
- URL base servizi
- Configurazione CORS

### .env.example
- Template per variabili ambiente
- Da copiare in `.env` (opzionale)

---

## 🚀 Flusso di Lavoro Consigliato

### 📖 Fase Studio (1-2 ore)

1. ✅ Leggi **START_HERE.md** - Motivazione
2. ✅ Leggi **README.md** - Panoramica consegne
3. ✅ Segui **SETUP.md** - Installazione
4. ✅ Studia **services/user-service/** - Esempio completo
   - Leggi `userController.js`
   - Leggi `userDAO.js`
   - Capisce il pattern DAO
5. ✅ Esplora **shared/models/** - Album.js e Image.js
6. ✅ Esplora **shared/utils/** - 4 utility pronte

### 🔨 Fase Implementazione (10-12 ore)

#### CONSEGNA 1 - Album Service (6 ore)

1. Apri `services/album-service/src/dao/albumDAO.js`
2. Implementa metodi CRUD seguendo i TODO
3. Apri `services/album-service/src/controllers/albumController.js`
4. Implementa controller seguendo i TODO
5. Testa con `api.http` o Postman
6. Usa **CHECKLIST.md** per verificare

#### CONSEGNA 2 - Image Service (6 ore)

1. Apri `services/image-service/src/dao/imageDAO.js`
2. Implementa metodi CRUD seguendo i TODO
3. Apri `services/image-service/src/controllers/imageController.js`
4. Implementa controller seguendo i TODO
5. Implementa incremento views
6. Testa con `api.http` o Postman
7. Completa **CHECKLIST.md**

---

## 📚 Ordine di Lettura Consigliato

### Per Chi Va di Fretta (1 ora)
1. **START_HERE.md** (10 min) - Quick start
2. **README.md** (15 min) - Consegne
3. **User Service** (35 min) - Esempio
4. 🚀 **Inizia a codare!**

### Per Chi Vuole Capire Bene (2-3 ore)
1. **START_HERE.md** (15 min)
2. **README.md** (20 min)
3. **ARCHITECTURE.md** (30 min)
4. **PROJECT_STRUCTURE.md** (10 min) - Questo file
5. **SETUP.md** (20 min)
6. **User Service completo** (1 ora)
7. **shared/models + utils** (30 min)
8. 🚀 **Inizia implementazione**

---

## 💡 Tips per Non Perdersi

### ✅ DO - Fai Questo

- **Studia User Service prima** - È oro colato!
- **Usa i modelli** in `shared/models/` - Sono fatti apposta
- **Usa le utility** in `shared/utils/` - Risparmia tempo
- **Testa frequentemente** - Dopo ogni metodo
- **Segui i TODO** - Contengono hint preziosi
- **Consulta CHECKLIST.md** - Traccia progresso
- **Chiedi aiuto se blocco >30 min** - Non perdere tempo

### ❌ DON'T - Evita Questo

- **Non ignorare User Service** - È il tuo template!
- **Non reinventare la ruota** - Usa utility esistenti
- **Non fare tutto insieme** - Un metodo alla volta
- **Non saltare i test** - Verifica subito
- **Non ignorare gli errori** - Leggili e capiscili

---

## 🎯 Dove Trovare Cosa

### Cerchi esempi di...

| Cosa | Dove Guardare |
|------|---------------|
| **Come implementare DAO** | `services/user-service/src/dao/userDAO.js` |
| **Come implementare Controller** | `services/user-service/src/controllers/userController.js` |
| **Come usare modelli** | `shared/models/User.js` |
| **Come gestire errori** | `shared/utils/errorHandler.js` |
| **Come validare input** | `shared/utils/validator.js` |
| **Come salvare JSON** | `shared/utils/jsonHelper.js` |
| **Come testare endpoint** | `api.http` o `TESTING.md` |
| **Problemi comuni** | `FAQ.md` |

### Hai un errore?

1. **500 Internal Server Error** → Guarda console del servizio
2. **404 Not Found** → Verifica URL e porta
3. **Dati non salvano** → Controlla `data/*.json` formato
4. **Servizio non parte** → Verifica `npm install` fatto

---

## � Cosa È Pronto, Cosa Va Fatto

### ✅ Pronto all'Uso (Non toccare!)

- Gateway con routing completo
- User Service (esempio)
- Tutti i modelli (User, Album, Image)
- Tutte le utility (errorHandler, validator, jsonHelper, httpClient)
- Configurazioni (ports, cors, etc)
- Route definitions (già definite)
- Server Express (index.js già pronti)

### 📝 Da Implementare (Le 2 Consegne)

- `services/album-service/src/dao/albumDAO.js` - 6 metodi
- `services/album-service/src/controllers/albumController.js` - 6 metodi
- `services/image-service/src/dao/imageDAO.js` - 7 metodi
- `services/image-service/src/controllers/imageController.js` - 7 metodi

**Totale**: ~26 metodi da implementare (molti simili tra loro!)

---

## 🎓 Cosa Imparerai da Ogni File

| File | Cosa Impari |
|------|-------------|
| **userController.js** | Business logic, validazione, error handling |
| **userDAO.js** | Pattern DAO, operazioni CRUD, JSON storage |
| **User.js (model)** | Data modeling, validazione struttura |
| **errorHandler.js** | Async error handling pattern |
| **validator.js** | Input validation best practices |
| **jsonHelper.js** | File I/O, data persistence |
| **gateway/index.js** | API Gateway, proxy, routing |

---

## 🔮 Evoluzione Futura

Dopo aver completato le 2 consegne, il progetto può crescere:

### Fase 2 - Database
- Usa `sql/schema-light.sql`
- Modifica solo i DAO (controller restano uguali!)
- Impara SQL e relazioni

### Fase 3 - Funzionalità Avanzate
- Ricerca e filtri avanzati
- Sistema di commenti
- Paginazione risultati

### Fase 4 - Auth
- JWT authentication
- Protected routes
- User sessions

### Fase 5+ - Production
- Docker
- Frontend React/Vue
- Deploy cloud

---

**Ora hai la mappa completa! Buon lavoro! 🚀**

_Per domande: controlla FAQ.md_  
_Per iniziare: leggi START_HERE.md_  
_Per consegne: leggi README.md_