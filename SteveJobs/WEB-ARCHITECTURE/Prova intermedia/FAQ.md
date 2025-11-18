# FAQ - Domande Frequenti

## Generale

### Q: Perché usiamo microservizi invece di un'app monolitica?

**A**: I microservizi permettono di:
- Separare le responsabilità
- Scalare singolarmente i servizi
- Lavorare in team su servizi diversi
- Aggiornare/debuggare parti specifiche senza toccare tutto

### Q: Perché partiamo da JSON invece di database?

**A**: Per concentrarvi sulla logica di business senza preoccuparvi subito di SQL. Il pattern DAO rende facile il passaggio futuro a MySQL.

### Q: Devo implementare tutto da solo?

**A**: No! User Service è già completo come esempio. Usalo come riferimento per gli altri servizi.

---

## Setup e Installazione

### Q: npm install dà errore "permission denied"

**A**: Probabilmente problemi di permessi. Prova:
```bash
sudo chown -R $USER ~/.npm
npm cache clean --force
npm run install:all
```

### Q: "Cannot find module '../../../shared/config'"

**A**: Sei nella cartella giusta? Assicurati di eseguire i comandi dalla root del progetto, non da una sottocartella.

### Q: Come faccio a sapere se un servizio è avviato?

**A**: Controlla con curl:
```bash
curl http://localhost:3002/health
```
Se risponde con `{"status":"UP",...}` è attivo.

---

## Sviluppo

### Q: Da dove inizio?

**A**: Segui le consegne in ordine:
1. Setup e test (CONSEGNA 1)
2. User Service (CONSEGNA 2) - già implementato, studialo!
3. Album Service (CONSEGNA 3)
4. E così via...

### Q: Come testo un endpoint?

**A**: Usa curl:
```bash
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"username":"test","email":"test@test.com","password":"pass"}'
```

Oppure Postman per un'interfaccia grafica.

### Q: Il mio metodo nel controller non viene chiamato

**A**: Verifica:
1. Route configurata correttamente in `routes/*.js`
2. Controller importato nel file routes
3. URL chiamato corretto
4. Metodo HTTP corretto (GET, POST, PUT, DELETE)

### Q: "Method not implemented 501"

**A**: È normale! Significa che quel metodo ha il TODO e devi implementarlo. È il punto di partenza!

---

## DAO e Dati

### Q: Dove vengono salvati i dati?

**A**: Nei file JSON in `data/*.json`. Esempio: `data/users.json`

### Q: Come resetto i dati per testare di nuovo?

**A**:
```bash
echo '{"data":[],"lastId":0}' > data/users.json
```

### Q: Perché usare il pattern DAO?

**A**: Per separare la logica di business (controller) dall'accesso ai dati (DAO). Quando passerai a MySQL cambierai solo i DAO!

### Q: Come funziona generateId()?

**A**: Legge `lastId` dal JSON, lo incrementa e lo usa come nuovo ID. Simula l'auto-increment di MySQL.

---

## Errori Comuni

### Q: "Port 3000 already in use"

**A**: Un altro processo usa quella porta. Trova e termina:
```bash
# Linux/Mac
lsof -i :3000
kill -9 <PID>

# O cambia porta in .env
GATEWAY_PORT=3001
```

### Q: "Cannot read property 'data' of undefined"

**A**: Probabilmente il file JSON è corrotto o vuoto. Ricrealo:
```bash
echo '{"data":[],"lastId":0}' > data/users.json
```

### Q: Password in chiaro nelle risposte

**A**: Usa sempre `user.toSafeObject()` nel controller prima di ritornare! Guarda User Service come esempio.

### Q: "Validation failed"

**A**: Controlla che tutti i campi obbligatori siano presenti. Ogni modello ha un metodo `validate()`.

---

## Microservizi e Comunicazione

### Q: Come fa un servizio a chiamare un altro?

**A**: Usa httpClient:
```javascript
const { userServiceClient, get } = require('../../../shared/utils/httpClient');
const user = await get(userServiceClient, `/api/users/${id}`, 'UserService');
```

### Q: Quando devo chiamare attraverso il gateway e quando direttamente?

**A**: 
- **Client esterno → Gateway** (porta 3000)
- **Servizio → Servizio** = diretto (porte 3001-3006)

### Q: Come gestisco errori tra servizi?

**A**: httpClient ha già gestione errori. Se un servizio non risponde, rilancia l'errore al chiamante.

---

## Autenticazione (Fase Futura)

### Q: Quando implementiamo JWT?

**A**: CONSEGNA 8 prepara la struttura, ma JWT vero arriverà dopo aver completato tutta la base.

### Q: Come proteggo gli endpoint?

**A**: Per ora sono tutti pubblici. In futuro con JWT:
1. Sistema di autenticazione genera token al login
2. Client invia token in header
3. Gateway verifica token
4. Se valido, inoltra richiesta

---

## Database MySQL (Fase Futura)

### Q: Quando passiamo a MySQL?

**A**: Dopo aver completato tutte le consegne con JSON e tutto funziona.

### Q: Cosa devo cambiare per usare MySQL?

**A**: Solo i DAO! I controller rimangono identici.

```javascript
// Prima (JSON)
async findById(id) {
  const jsonData = await readJSON(DATA_FILE);
  return findById(jsonData.data, id);
}

// Dopo (MySQL)
async findById(id) {
  const [rows] = await db.query('SELECT * FROM users WHERE id = ?', [id]);
  return rows[0];
}
```

### Q: Come eseguo lo schema SQL?

**A**:
```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p < sql/seed-data.sql
```

---

## Best Practices

### Q: Come nomino le variabili?

**A**: 
- camelCase per variabili/funzioni: `userId`, `getUserById`
- PascalCase per classi: `User`, `Album`
- UPPER_CASE per costanti: `DATA_FILE`, `JWT_SECRET`

### Q: Dove metto validazioni?

**A**: Due livelli:
1. **Modello** (`User.validate()`): validazioni strutturali
2. **Controller**: validazioni di business logic

### Q: Quando uso try-catch?

**A**: `asyncHandler` lo fa per te! Usa quello invece di wrappare tutto in try-catch.

### Q: Come organizzo il codice?

**A**: Struttura già pronta:
```
service/
├── src/
│   ├── index.js          # Server
│   ├── routes/           # Definizione route
│   ├── controllers/      # Logica business
│   └── dao/              # Accesso dati
```

---

## Testing

### Q: Come testo senza Postman?

**A**: Usa curl o crea file `test.http` con VS Code REST Client extension.

### Q: Devo testare ogni funzione?

**A**: Testa almeno gli scenari principali:
- Happy path (tutto va bene)
- Validazione (dati errati)
- Not found (risorsa inesistente)

### Q: Come faccio debug?

**A**: 
1. `console.log()` nel controller
2. Guarda log del servizio nel terminale
3. Usa debugger di VS Code

---

## Avanzate

### Q: Posso aggiungere nuovi endpoint?

**A**: Sì! Basta aggiungerli in routes e controller.

### Q: Posso modificare i modelli?

**A**: Sì, ma aggiorna anche lo schema SQL in `sql/schema.sql`

### Q: Come gestisco le immagini?

**A**: Le immagini sono gestite tramite URL remoti (es. Picsum, Imgur, etc). Non serve upload di file locali.

### Q: Posso usare TypeScript?

**A**: Puoi, ma richiede setup extra. JavaScript va bene per questo progetto.

---

## Aiuto

### Q: Sono bloccato, cosa faccio?

**A**: 
1. Leggi attentamente i commenti nei file TODO
2. Guarda User Service come esempio
3. Controlla TESTING.md per esempi
4. Chiedi al docente

### Q: Ho fatto tutto, cosa faccio ora?

**A**: 
1. Verifica tutti i test in TESTING.md
2. Migliora gestione errori
3. Aggiungi validazioni extra
4. Documenta il tuo codice
5. Prepara presentazione

---

**Non trovi la risposta? Chiedi al docente! 🙋**
