// <!-- Realizzare una pagina web che mostri un catalogo di dischi musicali in formato card,
// permettendo all’utente di sfogliare, filtrare e navigare tra i risultati tramite un’interfaccia user-friendly.

//     Requisiti di implementazione
// 1. Card del disco musicale
// Ogni disco sarà visualizzato come una card contenente:
// ·      Copertina (immagine)
// ·      Nome del disco
// ·      Artista
// ·      Categoria
// ·      Prezzo
// ·      Descrizione (massimo 2 righe, con ellissi per overflow)

// 2. Filtri (sidebar sinistra)
// La colonna sinistra dovrà contenere filtri selezionabili (checkbox o select):
// ·      Categoria (Pop, Rock, Jazz, ecc.)
// ·      Artista (lista dinamica in base ai dati)
// ·      Prezzo (range slider o min-max input)
// Ogni filtro applicato aggiornerà il contenuto mostrato nella griglia.
// 3. Paginazione
// ·      Paginazione in fondo alla griglia (standard numerata o “carica altri”)
// ·      Mostrare 12 dischi per pagina
// 4. Interazione
// ·      I filtri devono aggiornare il contenuto senza ricaricare la pagina (JS)
// ·      I dati devono essere caricati da un file JSON (come dischi_musicali.json fornito) -->

let dischi = [];
let dischiFiltrati = [];
let currentPage = 1;
const cardsPerPage = 12;
const copertine = ["disco2.jpg", "disco3.jpg", "disco4.jpg"];

async function fetchDischi() {
  try {
    const response = await fetch("dischi_musicali.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    dischi = await response.json();
    dischiFiltrati = [...dischi];
    return dischiFiltrati;
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
  }
}

function card(dischiFiltrati) {
  const div = document.createElement("div");

  // Ciclo array di copertine
  let i = 0;

  div.innerHTML = `
  <ul>
    <img src= ${copertine[i]}>
    <p>${dischiFiltrati.nome_disco}</p>
    <p>${dischiFiltrati.artista}</p>
    <p>${dischiFiltrati.categoria}</p>
    <p>${dischiFiltrati.prezzo}</p>
    <p>${dischiFiltrati.descrizione}</p>
  </ul>
  `;
  if (i < copertine.length) i++;
  else i = 0;
  return div;
}
card(dischiFiltrati);

function displayDischi() {
  const container = document.getElementById("dischi-container");
  const card = card(dischiFiltrati);

  container.appendChild(card);
}
displayDischi();

document.addEventListener("DOMContentLoaded", async () => {
  await fetchDischi();

  const categoryFilter = document.getElementById("category-select");
  const artistFilter = document.getElementById("artist-select");
  const pageContainer = document.getElementById("cards-container");
});
