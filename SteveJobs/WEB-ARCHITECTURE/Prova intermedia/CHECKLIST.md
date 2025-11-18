# PhotoGallery Microservices - Checklist Progetto (Versione Light)

## ✅ Checklist Completamento

Usa questa checklist per verificare il tuo progresso sulle **2 consegne**:

---

## 📦 Setup Iniziale (Prerequisiti)

- [ ] Clone/download progetto completato
- [ ] `npm install` nella root eseguito
- [ ] `npm run install:all` completato (installa dipendenze tutti i servizi)
- [ ] Gateway si avvia correttamente (`cd gateway && npm run dev`)
- [ ] User Service si avvia (`cd services/user-service && npm run dev`)
- [ ] Album Service si avvia (`cd services/album-service && npm run dev`)
- [ ] Image Service si avvia (`cd services/image-service && npm run dev`)
- [ ] Tutti i servizi accessibili tramite gateway (porta 3000)
- [ ] Health check gateway risponde: `http://localhost:3000/health`

**Tempo stimato**: 30 minuti

---

## 👤 Studio User Service (Prima di iniziare)

Prima di implementare, studia il servizio completo di esempio:

- [ ] Letto e compreso `services/user-service/src/dao/userDAO.js`
- [ ] Letto e compreso `services/user-service/src/controllers/userController.js`
- [ ] Letto e compreso `services/user-service/src/routes/index.js`
- [ ] Capito come funziona il pattern DAO
- [ ] Capito come si usano le utility in `shared/utils/`
- [ ] Capito come si usa il modello `User.js`
- [ ] Testato tutti gli endpoint user con Postman/REST Client

**Tempo stimato**: 1-2 ore

---

## 📁 CONSEGNA 1: Album Service (6 ore)

### Implementazione DAO
- [ ] Completato `albumDAO.js` - metodo `create()`
- [ ] Completato `albumDAO.js` - metodo `findAll()`
- [ ] Completato `albumDAO.js` - metodo `findById()`
- [ ] Completato `albumDAO.js` - metodo `update()`
- [ ] Completato `albumDAO.js` - metodo `delete()`
- [ ] Completato `albumDAO.js` - metodo `findByUserId()`

### Implementazione Controller
- [ ] Completato `albumController.js` - metodo `createAlbum()`
- [ ] Completato `albumController.js` - metodo `getAllAlbums()`
- [ ] Completato `albumController.js` - metodo `getAlbumById()`
- [ ] Completato `albumController.js` - metodo `updateAlbum()`
- [ ] Completato `albumController.js` - metodo `deleteAlbum()`
- [ ] Completato `albumController.js` - metodo `getUserAlbums()`

### Logica di Business
- [ ] Validazione: `name` obbligatorio
- [ ] Validazione: `userId` obbligatorio e deve esistere
- [ ] Album sempre pubblici (versione semplificata)
- [ ] Filtro album pubblici funzionante in `getAllAlbums()`
- [ ] Album privati visibili solo al proprietario

### Test Endpoint (via Gateway)
- [ ] ✅ POST `http://localhost:3000/api/albums` - Crea album
- [ ] ✅ GET `http://localhost:3000/api/albums` - Lista album pubblici
- [ ] ✅ GET `http://localhost:3000/api/albums/:id` - Singolo album
- [ ] ✅ PUT `http://localhost:3000/api/albums/:id` - Aggiorna album
- [ ] ✅ DELETE `http://localhost:3000/api/albums/:id` - Elimina album
- [ ] ✅ GET `http://localhost:3000/api/albums/user/:userId` - Album utente

### Gestione Errori
- [ ] Errore 400 se mancano campi obbligatori
- [ ] Errore 404 se album non trovato
- [ ] Errore 404 se userId non esiste
- [ ] Errore 500 gestito con try-catch
- [ ] Messaggi di errore chiari e descrittivi

### Verifica Dati
- [ ] File `data/albums.json` si aggiorna correttamente
- [ ] Dati persistono dopo riavvio servizio
- [ ] Formato JSON valido nel file

**Tempo stimato**: 6 ore

---

## 🖼️ CONSEGNA 2: Image Service (6 ore)

### Implementazione DAO
- [ ] Completato `imageDAO.js` - metodo `create()`
- [ ] Completato `imageDAO.js` - metodo `findAll()`
- [ ] Completato `imageDAO.js` - metodo `findById()`
- [ ] Completato `imageDAO.js` - metodo `update()`
- [ ] Completato `imageDAO.js` - metodo `delete()`
- [ ] Completato `imageDAO.js` - metodo `findByAlbumId()`
- [ ] Completato `imageDAO.js` - metodo `incrementViews()`

### Implementazione Controller
- [ ] Completato `imageController.js` - metodo `createImage()`
- [ ] Completato `imageController.js` - metodo `getAllImages()`
- [ ] Completato `imageController.js` - metodo `getImageById()`
- [ ] Completato `imageController.js` - metodo `updateImage()`
- [ ] Completato `imageController.js` - metodo `deleteImage()`
- [ ] Completato `imageController.js` - metodo `getAlbumImages()`
- [ ] Completato `imageController.js` - metodo `incrementImageViews()`

### Logica di Business
- [ ] Validazione: `title` obbligatorio
- [ ] Validazione: `albumId` obbligatorio e deve esistere
- [ ] Validazione: `imageUrl` (URL immagine) obbligatorio e valido
- [ ] Campo `views` inizializza a 0
- [ ] Metodo `incrementViews()` aumenta contatore correttamente
- [ ] Tags salvati come array di stringhe
- [ ] Campi `createdAt` e `updatedAt` gestiti automaticamente

### Test Endpoint (via Gateway)
- [ ] ✅ POST `http://localhost:3000/api/images` - Carica immagine
- [ ] ✅ GET `http://localhost:3000/api/images` - Lista immagini
- [ ] ✅ GET `http://localhost:3000/api/images/:id` - Singola immagine
- [ ] ✅ PUT `http://localhost:3000/api/images/:id` - Aggiorna metadati
- [ ] ✅ DELETE `http://localhost:3000/api/images/:id` - Elimina immagine
- [ ] ✅ GET `http://localhost:3000/api/images/album/:albumId` - Immagini album
- [ ] ✅ POST `http://localhost:3000/api/images/:id/view` - Incrementa views

### Gestione Errori
- [ ] Errore 400 se mancano campi obbligatori
- [ ] Errore 404 se immagine non trovata
- [ ] Errore 404 se albumId non esiste
- [ ] Errore 500 gestito con try-catch
- [ ] Messaggi di errore chiari

### Verifica Dati
- [ ] File `data/images.json` si aggiorna correttamente
- [ ] Relazione albumId corretta
- [ ] Contatore views funziona
- [ ] Dati persistono dopo riavvio

**Tempo stimato**: 6 ore

---

### Testing
- [ ] Ogni endpoint testato con success case
- [ ] Testati casi di errore
- [ ] Testata validazione
- [ ] Testata relazione tra entità## 📊 Requisiti di Qualità

### Codice
- [ ] Codice ben indentato e leggibile
- [ ] Nomi variabili/funzioni significativi (in italiano o inglese, ma coerenti)
- [ ] Commenti dove necessario (sopratutto logica complessa)
- [ ] No console.log inutili (solo per debug necessario)
- [ ] No codice commentato o TODO lasciati
- [ ] No errori nel terminale all'avvio

### Validazione
- [ ] Tutti i campi obbligatori validati prima di salvare
- [ ] Lunghezza stringhe controllata (es: title max 100 char)
- [ ] Riferimenti (userId, albumId) verificati esistano
- [ ] Gestione errori appropriata per ogni caso

### Gestione Errori
- [ ] 200 OK per successi (GET, PUT, DELETE)
- [ ] 201 Created per nuove risorse (POST)
- [ ] 400 Bad Request per dati non validi
- [ ] 404 Not Found per risorse inesistenti
- [ ] 500 Internal Server Error per errori imprevisti
- [ ] Messaggi di errore chiari e descrittivi in italiano

### Architettura
- [ ] Pattern DAO rispettato (no logica business nel DAO)
- [ ] Controller snelli (validazione + chiamata DAO + risposta)
- [ ] Riutilizzo utility condivise (errorHandler, validator, jsonHelper)
- [ ] Modelli usati per validazione e struttura dati
- [ ] Separazione concerns (routes → controller → DAO)

---

## 🎓 Criteri di Valutazione

### Sufficienza (18-21/30)
- ✅ Setup completato e servizi avviati
- ✅ CONSEGNA 1 (Album Service) implementata con CRUD base
- ✅ CONSEGNA 2 (Image Service) implementata con CRUD base
- ✅ Validazione minima presente
- ✅ Almeno 70% endpoint funzionanti
- ⚠️ Possibili bug minori o gestione errori incompleta

### Discreto (22-24/30)
- ✅ Tutto quanto sopra +
- ✅ Entrambe le consegne completate al 100%
- ✅ Validazione completa su tutti i campi
- ✅ Gestione errori corretta (400/404/500)
- ✅ Codice ordinato e leggibile
- ✅ Test completati e documentati

### Buono (25-27/30)
- ✅ Tutto quanto sopra +
- ✅ Codice ben organizzato con commenti utili
- ✅ Gestione edge cases (es: cosa succede se album vuoto?)
- ✅ Logica di filtro pubblico/privato implementata correttamente
- ✅ Relazioni tra entità gestite perfettamente
- ✅ Test sistematici su tutti gli scenari

### Ottimo (28-30/30)
- ✅ Tutto quanto sopra +
- ✅ Codice professionale e ben documentato
- ✅ Implementazione bonus (es: search, pagination, sorting)
- ✅ Gestione avanzata errori con logging
- ✅ Preparazione ottima per migrazione DB (DAO già pronto)
- ✅ Dimostrazione comprensione profonda architettura microservizi

---

## 📅 Timeline Suggerita (4-5 Lezioni)

### Lezione 1 (2-3 ore)
- Setup ambiente e installazione (30 min)
- Studio architettura e documentazione (1 ora)
- **Studio completo User Service** (1-1.5 ore)
- Test User Service per comprendere funzionamento

### Lezione 2 (3 ore)
- **CONSEGNA 1 - Parte 1**: Album DAO (1.5 ore)
- **CONSEGNA 1 - Parte 2**: Album Controller (1.5 ore)

### Lezione 3 (3 ore)
- Completamento CONSEGNA 1 se necessario (1 ora)
- Test completi Album Service (30 min)
- **CONSEGNA 2 - Parte 1**: Image DAO (1.5 ore)

### Lezione 4 (3 ore)
- **CONSEGNA 2 - Parte 2**: Image Controller (2 ore)
- Test Image Service (30 min)
- Fix bug e refinement (30 min)

### Lezione 5 (2 ore) - Opzionale
- Testing completo end-to-end
- Documentazione del proprio lavoro
- Preparazione presentazione risultati

**Totale: 11-13 ore**

---

## 💡 Suggerimenti per il Successo

### Prima di Iniziare
1. **Leggi TUTTO il User Service**: È il tuo modello di riferimento
2. **Studia i modelli** in `shared/models/` - sono la tua struttura dati
3. **Familiarizza con le utility** - ti fanno risparmiare tempo
4. **Prepara Postman/REST Client** - dovrai testare molto

### Durante l'Implementazione
1. **Un metodo alla volta**: Non fare tutto insieme
2. **Testa immediatamente**: Dopo ogni metodo, testalo
3. **Usa console.log per debug**: Stampa per capire il flusso
4. **Segui i TODO**: Nei file ci sono suggerimenti preziosi
5. **Copia e adatta**: User Service è il template, usa la stessa struttura

### Problem Solving
1. **Errore 500**: Controlla console del servizio per lo stack trace
2. **Errore 404**: Verifica percorso endpoint e che servizio sia avviato
3. **Dati non salvano**: Controlla permessi cartella `data/` e formato JSON
4. **Validazione fallisce**: Usa `console.log(req.body)` per vedere i dati

### Best Practices
1. ✅ Usa `async/await` per operazioni asincrone
2. ✅ Usa `try/catch` per gestire errori
3. ✅ Valida SEMPRE i dati in ingresso
4. ✅ Ritorna sempre oggetti JSON consistenti: `{ success, data/error, message }`
5. ✅ Separa concerns: Controller chiama DAO, DAO accede dati

---

## 🎯 Cosa Imparerai

Completando questo progetto acquisirai competenze su:

### Architettura Software
- ✅ Microservices architecture pattern
- ✅ API Gateway pattern
- ✅ Service communication
- ✅ Separation of concerns
- ✅ DAO (Data Access Object) pattern

### Backend Development
- ✅ Express.js framework
- ✅ RESTful API design
- ✅ CRUD operations
- ✅ Data validation
- ✅ Error handling
- ✅ JSON file storage

### Professional Skills
- ✅ Code organization
- ✅ Testing methodologies
- ✅ Debugging techniques
- ✅ Reading documentation
- ✅ Following existing codebase patterns

---

## 🚀 Evoluzioni Future (Post-Progetto)

### Fase 2 - Database (2-3 lezioni)
- Installazione MySQL
- Esecuzione script `sql/schema.sql`
- Modifica DAO per usare query SQL invece di JSON
- **Vantaggio pattern DAO**: Controller non cambia!

### Fase 3 - Autenticazione JWT (2 lezioni)
- Implementazione token generation
- Middleware di autenticazione
- Protezione endpoint sensibili
- Refresh token mechanism

### Fase 4 - Funzionalità Avanzate (2 lezioni)
- Ricerca e filtri
- Paginazione risultati
- Sistema di commenti
- Statistiche e analytics

### Fase 5 - Containerizzazione (1-2 lezioni)
- Dockerfile per ogni servizio
- Docker Compose orchestration
- Container networking
- Deploy con Docker

### Fase 6 - Frontend (4-5 lezioni)
- React/Vue.js SPA
- Integrazione con API
- Gestione immagini con URL
- Gallery responsive

---

## 📞 Risorse e Supporto

### Documentazione Progetto
- 📖 `README.md` - Overview generale e consegne
- ⚙️ `SETUP.md` - Guida installazione dettagliata
- 🧪 `TESTING.md` - Come testare gli endpoint
- ❓ `FAQ.md` - Domande frequenti e troubleshooting
- 🏗️ `ARCHITECTURE.md` - Spiegazione architettura

### File di Test
- `api.http` - Esempi richieste REST Client (40+ esempi)
- Puoi importarli in Postman o usarli con REST Client extension

### In Caso di Problemi
1. 🔍 Controlla `FAQ.md` - potrebbero esserci già le risposte
2. 📝 Rileggi i commenti nel codice - ci sono hint
3. 👁️ Guarda User Service - è l'esempio completo
4. 🤝 Chiedi al docente - meglio chiedere che restare bloccati

### Docenti
- Consultare `DOCENTE.md` per criteri valutazione dettagliati
- Rubrica di valutazione completa
- Problemi comuni e soluzioni
- Checklist correzione

---

**Buon Lavoro e In Bocca al Lupo! 🍀💪**

_"Il modo migliore per imparare è fare" - Non aver paura di sbagliare!_
