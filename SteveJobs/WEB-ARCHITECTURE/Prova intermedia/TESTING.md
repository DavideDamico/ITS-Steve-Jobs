# Guida Testing - PhotoGallery API

## 📝 Introduzione

Questa guida ti aiuta a testare le API dei microservizi.

## 🛠️ Tool per Testing

### 1. cURL (Command Line)

```bash
# GET request
curl http://localhost:3000/api/users

# POST request
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"username":"mario","email":"mario@test.com","password":"password123"}'

# PUT request
curl -X PUT http://localhost:3000/api/users/1 \
  -H "Content-Type: application/json" \
  -d '{"firstName":"Mario"}'

# DELETE request
curl -X DELETE http://localhost:3000/api/users/1
```

### 2. Postman

1. Scarica [Postman](https://www.postman.com/downloads/)
2. Importa la collection `postman_collection.json` (se fornita)
3. Testa gli endpoint visualmente

### 3. VS Code REST Client

Installa l'estensione "REST Client" e usa il file `api.http`:

```http
### Health Check
GET http://localhost:3000/health

### Crea Utente
POST http://localhost:3000/api/users
Content-Type: application/json

{
  "username": "testuser",
  "email": "test@example.com",
  "password": "password123"
}
```

## 📋 Test per Consegna

### CONSEGNA 1 - Setup Base

```bash
# Test 1: Gateway is running
curl http://localhost:3000/health

# Test 2: All services are running (4 microservices)
curl http://localhost:3002/health  # Users
curl http://localhost:3003/health  # Albums
curl http://localhost:3004/health  # Images

# Test 3: Gateway routing
curl http://localhost:3000/api/users
```

✅ **Successo**: Tutti i servizi rispondono con status "UP"

---

### CONSEGNA 2 - User Service

#### Test Creazione Utente

```bash
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "username": "mario_rossi",
    "email": "mario@example.com",
    "password": "password123",
    "firstName": "Mario",
    "lastName": "Rossi"
  }'
```

**Risposta attesa**:
```json
{
  "success": true,
  "message": "Utente creato con successo",
  "data": {
    "id": 1,
    "username": "mario_rossi",
    "email": "mario@example.com",
    "firstName": "Mario",
    "lastName": "Rossi",
    ...
  }
}
```

#### Test Lista Utenti

```bash
curl http://localhost:3000/api/users
```

#### Test Singolo Utente

```bash
curl http://localhost:3000/api/users/1
```

#### Test Aggiornamento

```bash
curl -X PUT http://localhost:3000/api/users/1 \
  -H "Content-Type: application/json" \
  -d '{
    "bio": "Fotografo appassionato"
  }'
```

#### Test Eliminazione

```bash
curl -X DELETE http://localhost:3000/api/users/1
```

#### Test Validazione

```bash
# Email non valida (deve dare errore)
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "username": "test",
    "email": "not-an-email",
    "password": "pass"
  }'
```

**Risposta attesa**: Errore 400

✅ **Criteri di Successo**:
- [ ] Tutti i 5 endpoint CRUD funzionano
- [ ] Validazione email/username funziona
- [ ] Password non visibile nelle risposte
- [ ] Errori gestiti correttamente

---

### CONSEGNA 3 - Album Service

```bash
# Crea album pubblico
curl -X POST http://localhost:3000/api/albums \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Vacanze",
    "description": "Foto mare",
    "userId": 1
  }'

# Crea album privato
curl -X POST http://localhost:3000/api/albums \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Album Lavoro", 
    "description": "Foto progetto",
    "userId": 2
  }'

# Lista album pubblici
curl http://localhost:3000/api/albums

# Album di un utente
curl http://localhost:3000/api/albums/user/1
```

✅ **Criteri di Successo**:
- [ ] Creazione album funziona
- [ ] Filtro pubblico/privato corretto
- [ ] Album visibili a tutti (versione semplificata)

---

### CONSEGNA 4 - Image Service

```bash
# Aggiungi immagine
curl -X POST http://localhost:3000/api/images \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Tramonto",
    "description": "Bellissimo tramonto sul mare",
    "albumId": 1,
    "userId": 1,
    "imageUrl": "https://picsum.photos/800/600?random=5",
    "tags": ["mare", "tramonto", "natura"]
  }'

# Immagini di un album
curl http://localhost:3000/api/images/album/1

# Singola immagine
curl http://localhost:3000/api/images/1
```

✅ **Criteri di Successo**:
- [ ] Immagini associate correttamente agli album
- [ ] Metadati salvati
- [ ] Filtri per album funzionanti

---

## 🎯 Test Completi Completati!

Hai completato tutti i test per le **2 consegne principali**:

✅ **Album Service** - CRUD completo con relazioni User  
✅ **Image Service** - CRUD completo con relazioni Album

### 🚀 Prossimi Passi

Se hai tempo extra, puoi:
- Migliorare validazione e gestione errori
- Aggiungere test automatici
- Implementare upload file reali
- Creare frontend per consumare le API

✅ **Criteri di Successo**:
- [ ] Album e immagini gestiti correttamente
- [ ] Relazioni user-album-image funzionano
- [ ] Validazione dati implementata

---

### Fasi Future (Opzionali)

```bash
# Crea due utenti
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"username":"user1","email":"user1@test.com","password":"pass123"}'

curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"username":"user2","email":"user2@test.com","password":"pass123"}'

# User1 crea album
curl -X POST http://localhost:3000/api/albums \
  -H "Content-Type: application/json" \
  -d '{"name":"Foto Personali","userId":1}'

# Test visibilità album (tutti pubblici nella versione semplificata)
curl "http://localhost:3000/api/albums/user/1"  # Vede tutti gli album
```

✅ **Criteri di Successo**:
- [ ] Album visibili a tutti gli utenti
- [ ] Filtri per utente funzionanti
- [ ] CRUD completo per album e immagini

---

## 🧪 Script di Test Automatico

Crea un file `test.sh`:

```bash
#!/bin/bash

echo "🧪 Testing PhotoGallery API..."

echo "1. Creating user..."
USER_RESPONSE=$(curl -s -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","email":"test@test.com","password":"pass123"}')

echo $USER_RESPONSE | grep -q "success.*true" && echo "✅ User created" || echo "❌ User creation failed"

echo "2. Creating album..."
ALBUM_RESPONSE=$(curl -s -X POST http://localhost:3000/api/albums \
  -H "Content-Type: application/json" \
  -d '{"name":"Test Album","userId":1}')

echo $ALBUM_RESPONSE | grep -q "success.*true" && echo "✅ Album created" || echo "❌ Album creation failed"

# ... altri test
```

Rendi eseguibile:
```bash
chmod +x test.sh
./test.sh
```

## 📊 Checklist Completa

### Setup
- [ ] Tutti i servizi si avviano
- [ ] Gateway raggiunge tutti i servizi
- [ ] Health check funzionano

### User Service
- [ ] CREATE user
- [ ] READ all users
- [ ] READ single user
- [ ] UPDATE user
- [ ] DELETE user
- [ ] Validazione funziona
- [ ] Password hashata e nascosta

### Album Service
- [ ] CRUD completo
- [ ] Filtro pubblico/privato
- [ ] Album per utente

### Image Service
- [ ] CRUD completo
- [ ] Relazione con album
- [ ] Metadati salvati

### Funzionalità Base Complete
- [ ] Tutte le funzionalità CRUD implementate
- [ ] Relazioni tra entità funzionanti
- [ ] Validazione presente su tutti i servizi
- [ ] Gestione errori appropriata

## 🎯 Tips

1. **Testa in ordine**: Prima user, poi album (serve userId), poi image (serve albumId), etc.
2. **Usa variabili**: Salva gli ID per riutilizzarli
3. **Controlla log**: I servizi stampano le richieste
4. **Status code**: 200 OK, 201 Created, 400 Bad Request, 404 Not Found, 500 Error
5. **JSON valido**: Usa un validator online se hai dubbi

**Happy Testing! 🚀**
