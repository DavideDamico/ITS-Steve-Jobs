# Postman Collection - PhotoGallery API

Importa questo file in Postman per avere tutti gli endpoint pronti da testare.

## Come Importare

1. Apri Postman
2. Click su "Import" in alto a sinistra
3. Seleziona questo file
4. Tutti gli endpoint saranno disponibili nella collection "PhotoGallery"

## Collection JSON

```json
{
  "info": {
    "name": "PhotoGallery API",
    "description": "Collection per testare i microservizi PhotoGallery",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Health Checks",
      "item": [
        {
          "name": "Gateway Health",
          "request": {
            "method": "GET",
            "url": "http://localhost:3000/health"
          }
        },
        {
          "name": "User Service Health",
          "request": {
            "method": "GET",
            "url": "http://localhost:3002/health"
          }
        },
        {
          "name": "Album Service Health",
          "request": {
            "method": "GET",
            "url": "http://localhost:3003/health"
          }
        }
      ]
    },
    {
      "name": "Users",
      "item": [
        {
          "name": "Get All Users",
          "request": {
            "method": "GET",
            "url": "http://localhost:3000/api/users"
          }
        },
        {
          "name": "Get User by ID",
          "request": {
            "method": "GET",
            "url": "http://localhost:3000/api/users/1"
          }
        },
        {
          "name": "Create User",
          "request": {
            "method": "POST",
            "header": [{"key": "Content-Type", "value": "application/json"}],
            "url": "http://localhost:3000/api/users",
            "body": {
              "mode": "raw",
              "raw": "{\n  \"username\": \"mario_rossi\",\n  \"email\": \"mario@example.com\",\n  \"password\": \"password123\",\n  \"firstName\": \"Mario\",\n  \"lastName\": \"Rossi\"\n}"
            }
          }
        },
        {
          "name": "Update User",
          "request": {
            "method": "PUT",
            "header": [{"key": "Content-Type", "value": "application/json"}],
            "url": "http://localhost:3000/api/users/1",
            "body": {
              "mode": "raw",
              "raw": "{\n  \"bio\": \"Fotografo professionista\"\n}"
            }
          }
        },
        {
          "name": "Delete User",
          "request": {
            "method": "DELETE",
            "url": "http://localhost:3000/api/users/1"
          }
        }
      ]
    },
    {
      "name": "Albums",
      "item": [
        {
          "name": "Get All Albums",
          "request": {
            "method": "GET",
            "url": "http://localhost:3000/api/albums"
          }
        },
        {
          "name": "Create Album",
          "request": {
            "method": "POST",
            "header": [{"key": "Content-Type", "value": "application/json"}],
            "url": "http://localhost:3000/api/albums",
            "body": {
              "mode": "raw",
              "raw": "{\n  \"name\": \"Vacanze 2024\",\n  \"description\": \"Foto del mare\",\n  \"userId\": 1\n}"
            }
          }
        },
        {
          "name": "Get Albums by User",
          "request": {
            "method": "GET",
            "url": "http://localhost:3000/api/albums/user/1"
          }
        }
      ]
    },
    {
      "name": "Images",
      "item": [
        {
          "name": "Create Image",
          "request": {
            "method": "POST",
            "header": [{"key": "Content-Type", "value": "application/json"}],
            "url": "http://localhost:3000/api/images",
            "body": {
              "mode": "raw",
              "raw": "{\n  \"title\": \"Tramonto\",\n  \"description\": \"Bellissimo tramonto\",\n  \"albumId\": 1,\n  \"userId\": 1,\n  \"imageUrl\": \"https://picsum.photos/800/600?random=5\",\n  \"tags\": [\"mare\", \"tramonto\"]\n}"
            }
          }
        },
        {
          "name": "Get Images by Album",
          "request": {
            "method": "GET",
            "url": "http://localhost:3000/api/images/album/1"
          }
        }
      ]
    }
  ]
}

## 📋 Come Usare

1. **Importa in Postman**: Copia il JSON sopra e importa come nuova collection
2. **Testa in ordine**: Segui le numerazione delle consegne
3. **Create User**: Prima crea utenti di test
4. **Create Album**: Poi crea album per gli utenti
5. **Add Images**: Infine aggiungi immagini agli album

## 🎯 Test Flow

\`\`\`plaintext
1. POST /users (crea utente test)
2. POST /albums (crea album per utente)
3. POST /images (aggiungi immagini all'album)
4. GET /albums/user/1 (verifica album utente)
5. GET /images/album/1 (verifica immagini album)
\`\`\`

**Versione Semplificata - 4 Microservizi! 🚀**
