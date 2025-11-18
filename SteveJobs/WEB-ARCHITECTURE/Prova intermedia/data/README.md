# Data Directory

Questa cartella contiene i file JSON che simulano un database.

## Struttura

Ogni file JSON ha questa struttura:

```json
{
  "data": [
    // Array di oggetti
  ],
  "lastId": 0  // Ultimo ID assegnato
}
```

## File

- `users.json` - Dati utenti
- `albums.json` - Dati album  
- `images.json` - Dati immagini

## Note

⚠️ **Questi file vengono sovrascritti durante l'esecuzione dell'applicazione!**

Per resettare i dati, cancellare il contenuto e lasciare:
```json
{
  "data": [],
  "lastId": 0
}
```

## Gitignore

I file `*.json` sono ignorati da git (tranne gli esempi) per non committare i dati di test degli studenti.
