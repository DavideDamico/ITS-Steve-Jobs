# Guida Setup Progetto - Versione Light

## 📋 Prerequisiti

Prima di iniziare, assicurati di avere installato:

- **Node.js** v18 o superiore ([Download](https://nodejs.org/))
- **npm** v9 o superiore (incluso con Node.js)
- **Editor di codice** (VS Code consigliato con estensione REST Client)
- **Postman** o REST Client per testare API (opzionale ma consigliato)
- **Git** per versionamento (opzionale)

### Verifica Prerequisiti

```bash
node --version   # Deve essere >= v18
npm --version    # Deve essere >= v9
```

---

## 🚀 Setup Iniziale

### Passo 1: Installazione Dipendenze

Dalla root del progetto, esegui:

```bash
# Installa concurrently per avviare i servizi insieme
npm install

# Installa dipendenze di TUTTI i microservizi
npm run install:all
```

**⏱️ Tempo stimato**: 2-3 minuti (dipende dalla connessione internet)

**Cosa fa questo comando?**
- Installa `concurrently` nella root
- Installa dipendenze di Gateway
- Installa dipendenze di User Service
- Installa dipendenze di Album Service
- Installa dipendenze di Image Service

### Passo 2: Verifica Installazione

Controlla che le cartelle `node_modules` siano state create:

```bash
ls gateway/node_modules
ls services/user-service/node_modules
ls services/album-service/node_modules
ls services/image-service/node_modules
```

Se vedi file e cartelle, tutto ok! ✅

### Passo 3: Configurazione (Opzionale)

Il progetto usa configurazioni di default. Se vuoi personalizzare le porte:

```bash
cp .env.example .env
# Modifica .env se necessario (di solito non serve)
```

**Porte di default**:
- Gateway: `3000`
- User Service: `3002`
- Album Service: `3003`
- Image Service: `3004`

---

## ▶️ Avvio Applicazione

### Metodo 1: Avvio Tutti i Servizi (Consigliato)

```bash
# Dalla root del progetto
npm run dev:all
```

Questo comando avvia simultaneamente:
- ✅ Gateway (porta 3000)
- ✅ User Service (porta 3002)
- ✅ Album Service (porta 3003)
- ✅ Image Service (porta 3004)

**Output atteso**: Vedrai 4 finestre di log (una per servizio)

### Metodo 2: Avvio Singolo (Per Debug)

Apri 4 terminali separati:

**Terminal 1 - Gateway**:
```bash
cd gateway
npm run dev
```

**Terminal 2 - User Service**:
```bash
cd services/user-service
npm run dev
```

**Terminal 3 - Album Service**:
```bash
cd services/album-service
npm run dev
```

**Terminal 4 - Image Service**:
```bash
cd services/image-service
npm run dev
```

---

## ✅ Verifica Funzionamento

### Test 1: Health Check Gateway

```bash
curl http://localhost:3000/health
```

**Output atteso**:
```json
{
  "status": "UP",
  "service": "API Gateway",
  "timestamp": "2025-11-04T..."
}
```

### Test 2: Info Servizi Disponibili

```bash
curl http://localhost:3000/services
```

**Output atteso**: Lista dei 3 servizi (users, albums, images)

### Test 3: Health Check Servizi Individuali

```bash
curl http://localhost:3002/health  # User Service
curl http://localhost:3003/health  # Album Service
curl http://localhost:3004/health  # Image Service
```

Tutti dovrebbero rispondere con status `UP`

### Test 4: Endpoint Funzionale

```bash
# Tramite gateway
curl http://localhost:3000/api/users

# Direttamente al servizio
curl http://localhost:3002/api/users
```

**Output atteso**: Array vuoto `[]` o lista utenti se già popolato

---
## 🛠️ Comandi Utili

### Fermare i Servizi

Se hai avviato con `npm run dev:all`, premi `Ctrl+C` nel terminale.

Se hai terminali separati, fai `Ctrl+C` in ognuno.

### Riavviare Singolo Servizio

```bash
# Esempio: riavviare solo Album Service
cd services/album-service
npm run dev
```

### Pulire e Reinstallare

Se hai problemi con le dipendenze:

```bash
# Rimuovi tutti i node_modules
rm -rf node_modules gateway/node_modules services/*/node_modules

# Reinstalla tutto
npm run install:all
```

### Resettare i Dati JSON

Per tornare allo stato iniziale (array vuoto):

```bash
echo '{"data":[],"lastId":0}' > data/users.json
echo '{"data":[],"lastId":0}' > data/albums.json
echo '{"data":[],"lastId":0}' > data/images.json
```

### Verificare Porte Libere

```bash
# Linux/Mac - Vedere cosa usa una porta
lsof -i :3000
lsof -i :3002

# Killare processo su porta (se necessario)
kill -9 <PID>
```

---

## 🐛 Troubleshooting Comuni

### ❌ Errore: "Porta già in uso"

**Errore**: `EADDRINUSE: address already in use`

**Soluzione**:
```bash
# Trova processo sulla porta
lsof -i :3000

# Termina il processo
kill -9 <PID>

# Oppure cambia porta in .env
```

### ❌ Errore: "Cannot find module"

**Causa**: Dipendenze non installate

**Soluzione**:
```bash
npm run install:all
```

### ❌ Servizio non risponde

**Cosa controllare**:
1. Il servizio è avviato? Controlla il terminale
2. La porta è corretta? Verifica in `shared/config/index.js`
3. Firewall blocca la porta?

**Debug**:
```bash
# Test diretto al servizio (non via gateway)
curl http://localhost:3002/health
```

### ❌ Gateway non raggiunge servizi

**Cosa controllare**:
1. Tutti i servizi sono avviati?
2. Le porte in `shared/config/index.js` sono corrette?
3. Guarda i log del gateway per errori proxy

### ❌ Errore 500 su richiesta

**Debug**:
1. Guarda la console del servizio per lo stack trace
2. Controlla formato JSON nella richiesta
3. Verifica che tutti i campi obbligatori siano presenti

### ❌ Dati non si salvano

**Cosa controllare**:
1. La cartella `data/` esiste?
2. I file JSON hanno formato valido?
3. Permessi di scrittura sulla cartella?

**Buon Setup! 🚀**


---

## 📝 Checklist Setup Completo

Usa questa checklist per verificare il setup:

- [ ] Node.js v18+ installato
- [ ] npm v9+ installato
- [ ] Progetto scaricato/clonato
- [ ] `npm install` nella root eseguito
- [ ] `npm run install:all` completato senza errori
- [ ] Gateway si avvia (`cd gateway && npm run dev`)
- [ ] User Service si avvia
- [ ] Album Service si avvia
- [ ] Image Service si avvia
- [ ] Health check gateway risponde (`curl http://localhost:3000/health`)
- [ ] Health check servizi rispondono
- [ ] `/api/users` ritorna dati via gateway
- [ ] Postman/REST Client configurato e testato

**Se tutti i punti sono ✅, sei pronto per le consegne!**

---

## 🎯 Prossimi Passi

Dopo il setup:

1. **Leggi `START_HERE.md`** - Introduzione motivazionale
2. **Studia `ARCHITECTURE.md`** - Capire l'architettura
3. **Analizza User Service** - È il tuo esempio di riferimento
4. **Leggi le consegne in `README.md`** - Sapere cosa fare
5. **Usa `CHECKLIST.md`** - Tenere traccia progresso
6. **Consulta `TESTING.md`** - Imparare a testare

---

## � Supporto

**Problemi non risolti?**

1. Controlla `FAQ.md` - Potrebbe esserci già la risposta
2. Rileggi questa guida con attenzione
3. Cerca l'errore su Google/Stack Overflow
4. Chiedi al docente mostrandogli:
   - Messaggio di errore completo
   - Comandi eseguiti
   - Output della console

**Tips per chiedere aiuto**:
- 📸 Screenshot dell'errore
- 📋 Copia/incolla il comando e l'output
- 🔍 Descrivi cosa hai provato a fare
- ⏱️ Non aspettare di essere bloccato troppo a lungo

---

**Buon Setup! 🚀**

Soluzione:
```bash
# Trova processo sulla porta 3000 (o altra)
lsof -i :3000

# Termina il processo
kill -9 <PID>
```

### Errore "Cannot find module"

Verifica di aver installato tutte le dipendenze:
```bash
npm run install:all
```

### Errore ENOENT file not found

Verifica che i file JSON esistano:
```bash
ls -la data/*.json
```

Se mancano, creali:
```bash
mkdir -p data
echo '{"data":[],"lastId":0}' > data/users.json
# ... etc
```

### Gateway non raggiunge i servizi

Verifica che tutti i servizi siano avviati:
```bash
curl http://localhost:3002/health
curl http://localhost:3003/health
# ... etc
```

Se un servizio non risponde, avvialo singolarmente per vedere gli errori:
```bash
cd services/user-service && npm run dev
```

## 📚 Prossimi Passi

1. Leggi il [README.md](./README.md) principale per le consegne
2. Inizia dalla **CONSEGNA 1**: Setup e test
3. Procedi con **CONSEGNA 2**: Implementare User Service
4. Usa [TESTING.md](./TESTING.md) per testare le tue implementazioni

## 💡 Suggerimenti

- Usa terminali separati per vedere i log di ogni servizio
- Installa un'estensione REST Client per VS Code per testare facilmente
- Tieni aperto il file shared/utils/errorHandler.js per riferimento
- Consulta il codice di User Service come esempio per gli altri

## 🆘 Chiedi Aiuto

Se hai problemi:
1. Controlla i log del servizio specifico
2. Verifica che tutte le porte siano libere
3. Ricontrolla che le dipendenze siano installate
4. Consulta il docente

**Buon Coding! 🎉**
