// Esercizio 1: Real-Time Word Counter

// Obiettivo:
// Crea una semplice applicazione web che conti in tempo reale il numero di parole digitate in una textarea.

// Requisiti:
// •	Mostra una textarea dove l’utente può scrivere liberamente.
// •	Mostra in tempo reale il numero di parole contenute nel testo.
// •	Aggiorna il conteggio ogni volta che l’utente digita o modifica il testo.
// •	(Bonus) Mostra anche il numero di caratteri totali.
// •	(Bonus avanzato) Aggiungi un limite massimo di parole (es. 200) e avvisa l’utente se viene superato.

function countWords() {
  let text = document.getElementById("inputField").value;
  let numWords = 0;

  for (let i = 0; i < text.length; i++) {
    let character = text[i];

    if (character == " ") {
      numWords += 1;
    }

    document.getElementById("wordCount").innerHTML = numWords;
  }
}
