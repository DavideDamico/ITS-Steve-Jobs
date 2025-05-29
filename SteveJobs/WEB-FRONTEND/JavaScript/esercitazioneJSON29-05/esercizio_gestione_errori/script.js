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

document.addEventListener("DOMContentLoaded", function () {
  initializeApp();
});

function fetchAndStoreProfile() {
  fetch("profile.json")
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error: ${response.status}`);
      }
      return response.json();
    })
    .then((data) => {
      const dataToString = JSON.stringify(data);
      localStorage.setItem("userProfile", dataToString);

      console.log("Dati caricati con successo:", data);
      updateDOM("success", data);
    })
    .catch((error) => {
      console.error("Errore durante il caricamento:", error);
      writeCookie(
        "errorMessage",
        `Impossibile caricare i dati utente. Error: ${error.message}`
      );

      const localData = localStorage.getItem("userProfile");
      if (localData) {
        console.log("Dati trovati in localStorage:", JSON.parse(localData));
        updateDOM("localStorage", JSON.parse(localData));
      } else {
        const errorMessage = readCookie("errorMessage");
        console.log("Messaggio di errore dal cookie:", errorMessage);
        updateDOM("error", { errorMessage });
      }
    });
}

function readCookie(name) {
  const cookies = document.cookie.split(";");

  for (let i = 0; i < cookies.length; i++) {
    let cookie = cookies[i].trim();

    if (cookie.startsWith(name + "=")) {
      return cookie.substring(name.length + 1);
    }
  }
  return null;
}

function writeCookie(name, value) {
  document.cookie = name + "=" + value;
}

function updateDOM(status, data) {
  const container = document.getElementById("container");

  if (status === "success") {
    container.innerHTML = `
            <div class="success">
                <h2>Profilo caricato con successo!</h2>
                <div class="profile-info">
                    <p><strong>Nome:</strong> ${data.name}</p>
                    <p><strong>Email:</strong> ${data.email}</p>
                    <p><strong>Tema:</strong> ${data.preferences.theme}</p>
                </div>
                <p class="source">Fonte: Fetch da profile.json</p>
            </div>
        `;
  } else if (status === "localStorage") {
    container.innerHTML = `
            <div class="warning">
                <h2>Dati caricati da localStorage</h2>
                <div class="profile-info">
                    <p><strong>Nome:</strong> ${data.name}</p>
                    <p><strong>Email:</strong> ${data.email}</p>
                    <p><strong>Tema:</strong> ${data.preferences.theme}</p>
                </div>
                <p class="source">Fonte: localStorage (dati salvati in precedenza)</p>
            </div>
        `;
  } else if (status === "error") {
    container.innerHTML = `
            <div class="error">
                <h2>Errore nel caricamento</h2>
                <p>${data.errorMessage}</p>
                <p class="source">Fonte: Cookie di errore</p>
            </div>
        `;
  }
}

function clearStorage() {
  localStorage.removeItem("userProfile");
  document.cookie = "errorMessage=";
  console.log("Storage pulito!");
  location.reload();
}

function simulateError() {
  fetch("profile-nonexistent.json")
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error: ${response.status}`);
      }
      return response.json();
    })
    .catch((error) => {
      console.error("Errore simulato:", error);
      writeCookie("errorMessage", `Errore simulato: ${error.message}`);

      const localData = localStorage.getItem("userProfile");
      if (localData) {
        console.log("Dati trovati in localStorage:", JSON.parse(localData));
        updateDOM("localStorage", JSON.parse(localData));
      } else {
        const errorMessage = readCookie("errorMessage");
        console.log("Messaggio di errore dal cookie:", errorMessage);
        updateDOM("error", { errorMessage });
      }
    });
}

function initializeApp() {
  const container = document.getElementById("container");
  container.innerHTML = `
        <div class="loading">
            <h2>Caricamento profilo...</h2>
        </div>
    `;

  setTimeout(() => {
    fetchAndStoreProfile();
  }, 1000);
}
