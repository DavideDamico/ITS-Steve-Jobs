// Esercizio 3: Validazione di un modulo di registrazione con JavaScript

// Obiettivo:
// Realizza un modulo HTML per la registrazione di un utente e implementa in JavaScript la validazione dei campi prima dell’invio. Lo scopo è impedire l’invio del modulo se i dati inseriti non rispettano alcuni criteri, mostrando dei messaggi di errore vicino ai campi errati.

// Requisiti:

//     Crea un modulo HTML con i seguenti campi:
// •	Nome (campo di testo)
// •	Cognome (campo di testo)
// •	Codice Fiscale (campo di testo)
// •	Email (campo email)
// •	Via (campo di testo)
// •	Password (campo password, con possibilità di visualizzare la password in chiaro)
// •	Bottone di invio
//     Aggiungi uno spazio vicino a ciascun campo per mostrare un eventuale messaggio di errore.
//     Implementa la validazione lato client in JavaScript come segue:
// •	Il nome non può essere vuoto.
// •	Il cognome non può essere vuoto.
// •	L’email deve essere in un formato valido (es: nome@dominio.com).
// •	Il codice fiscale deve essere valido (AAABBB00A00B000B).
// •	La via deve contenere almeno 5 caratteri.
// •	La password deve contenere almeno 6 caratteri.
//     Quando il modulo viene inviato:
// •	Se tutti i campi sono validi, mostra un messaggio di conferma: “Registrazione avvenuta con successo” ed i campi vengono svuotati.
// •	Se uno o più campi sono errati, blocca l’invio (usa preventDefault()) e mostra i messaggi di errore relativi, evidenziando i campi non validi.
//     Aggiungi la validazione in tempo reale: ogni volta che l’utente modifica un campo (input), il messaggio di errore (se presente) deve sparire se il campo diventa valido.
