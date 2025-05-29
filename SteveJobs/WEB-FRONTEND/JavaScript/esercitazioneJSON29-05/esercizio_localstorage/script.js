// Esercizio 1: Salvataggio e Lettura da localStorage con dati da JSON Locale
// Obiettivo:
// Caricare asincronamente un file JSON locale, salvare un dato in localStorage, e leggerlo.
// Requisiti:
// Crea un file JSON locale chiamato user.json con contenuto tipo:
// { “name”: “Mario” }
// ·      Scrivi una funzione asincrona fetchUserName() che usa fetch() per leggere il file user.json.
// ·      Quando il dato viene caricato, salva la proprietà name in localStorage con chiave "userName".
// ·      Scrivi una funzione printUserName() che legge "userName" da localStorage e lo stampa in console.

async function fetchUserName() {
  try {
    const response = await fetch("user.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    // console.log(data.name);
    localStorage.setItem("userName", `${data.name}`);
    return localStorage.getItem("userName");
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
  }
}

fetchUserName();

async function printUserName() {
  const userName = await fetchUserName();
  console.log("L'username è:", userName);
}

printUserName();
