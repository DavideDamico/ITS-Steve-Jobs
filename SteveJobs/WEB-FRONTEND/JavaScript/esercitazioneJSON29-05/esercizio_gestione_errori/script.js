// Esercizio 3: Gestione Errori con localStorage, fallback cookie, e JSON Locale
// Obiettivo:
// Caricare asincronamente un file JSON locale che simula un profilo utente, gestire eventuali errori reali di caricamento, salvare dati o messaggi di errore, e fare fallback.
// Requisiti:
// ·     Crea un file profile.json con dati come:
// { “name”: “Mario”, “email”: “mario@example.com”, “preferences”: { “theme”: “dark” } }
// ·     Implementa fetchAndStoreProfile() che fa un fetch per leggere profile.json.
// ·     Gestisci eventuali errori reali di rete o di caricamento usando try/catch.
// ·     Se la chiamata ha successo, salva i dati in localStorage.
// ·     Se si verifica un errore (per esempio file mancante o problema di rete), salva un messaggio di errore in un cookie (es. “errorMessage” = “Impossibile caricare i dati utente”).
// ·     In caso di errore, prova a leggere i dati da localStorage:
// o  Se presenti, stampali in console.
// o  Se assenti, leggi e stampa il messaggio di errore dal cookie.
// ·     Usa async/await e implementa funzioni per leggere/scrivere cookie.
// Provare a fare interagire quanto di sopra con il DOM.

async function fetchAndStoreProfile() {
  try {
    const response = await fetch("profile.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    const dataToString = JSON.stringify(data);
    localStorage.setItem("userProfile", dataToString);

    // Controllo se i dati esistono nel local storage
    const getData = localStorage.getItem("userProfile");
    if (getData) console.log(getData);
    if (!getData) {
      console.log(document.cookie);
    }
  } catch (error) {
    document.cookie = `Error=Impossible to load user profile. Error: ${error}`;
  }
}

fetchAndStoreProfile();

async function readCookie() {}

async function writeCookie() {}
