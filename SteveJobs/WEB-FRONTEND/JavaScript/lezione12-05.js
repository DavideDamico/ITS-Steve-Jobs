// Esercitazione funzione closures

// 🧠 Esercizio: Contatore Personalizzato
// Scrivi una funzione crea_contatore(inizio) che restituisce una funzione
// interna chiamata conta, la quale:

// mantiene il valore corrente del contatore tra le chiamate,

// ogni volta che viene chiamata, incrementa e restituisce il contatore.

// 🧩 Obiettivo:
// Capire che la funzione interna mantiene l’accesso alle variabili della funzione
// esterna anche dopo che quest’ultima ha terminato l’esecuzione.

function crea_contatore() {
  let count = 0;

  return () => {
    count++;
    return count;
  };
}

const contatore1 = crea_contatore();
console.log(contatore1());
console.log(contatore1());
console.log(contatore1());

console.log("\n");

const contatore2 = crea_contatore();
console.log(contatore2());
console.log(contatore2());
console.log(contatore2());
console.log(contatore2());
console.log(contatore2());
console.log(contatore2());
console.log(contatore2());
