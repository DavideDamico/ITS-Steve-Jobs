// Esercizio 3: Validazione di un modulo di registrazione con JavaScript

// Obiettivo:
// Realizza un modulo HTML per la registrazione di un utente e implementa in JavaScript la validazione
// dei campi prima dell’invio. Lo scopo è impedire l’invio del modulo se i dati inseriti non
// rispettano alcuni criteri, mostrando dei messaggi di errore vicino ai campi errati.

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

document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("registrationForm");
  const successMessage = document.getElementById("successMessage");
  const passwordToggle = document.getElementById("passwordToggle");
  const passwordField = document.getElementById("password");

  if (!form || !successMessage || !passwordToggle || !passwordField) {
    console.error("Uno o più elementi del DOM non sono stati trovati");
    return;
  }

  const validationRules = {
    nome: {
      required: true,
      minLength: 1,
      message: "Il nome è obbligatorio",
    },
    cognome: {
      required: true,
      minLength: 1,
      message: "Il cognome è obbligatorio",
    },
    email: {
      required: true,
      pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
      message: "Inserisci un indirizzo email valido (es: nome@dominio.com)",
    },
    codiceFiscale: {
      required: true,
      pattern: /^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]$/,
      message: "Il codice fiscale deve seguire il formato: AAABBB00A00B000B",
    },
    via: {
      required: true,
      minLength: 5,
      message: "La via deve contenere almeno 5 caratteri",
    },
    password: {
      required: true,
      minLength: 6,
      message: "La password deve contenere almeno 6 caratteri",
    },
  };

  function validateField(fieldName, value) {
    const rule = validationRules[fieldName];

    if (rule.required && (!value || value.trim() === "")) {
      return { isValid: false, message: rule.message };
    }

    if (rule.minLength && value.trim().length < rule.minLength) {
      return { isValid: false, message: rule.message };
    }

    if (rule.pattern && !rule.pattern.test(value.trim())) {
      return { isValid: false, message: rule.message };
    }

    return { isValid: true, message: "" };
  }

  function showError(fieldName, message) {
    const field = document.getElementById(fieldName);
    const errorDiv = document.getElementById(fieldName + "Error");

    if (field && errorDiv) {
      field.classList.add("error");
      field.classList.remove("valid");
      errorDiv.textContent = message;
      errorDiv.classList.add("show");
    }
  }

  function hideError(fieldName) {
    const field = document.getElementById(fieldName);
    const errorDiv = document.getElementById(fieldName + "Error");

    if (field && errorDiv) {
      field.classList.remove("error");
      field.classList.add("valid");
      errorDiv.classList.remove("show");
    }
  }

  function validateForm() {
    let isFormValid = true;

    Object.keys(validationRules).forEach((fieldName) => {
      const field = document.getElementById(fieldName);
      if (field) {
        const validation = validateField(fieldName, field.value);

        if (!validation.isValid) {
          showError(fieldName, validation.message);
          isFormValid = false;
        } else {
          hideError(fieldName);
        }
      }
    });

    return isFormValid;
  }

  Object.keys(validationRules).forEach((fieldName) => {
    const field = document.getElementById(fieldName);

    if (field) {
      field.addEventListener("input", function () {
        const validation = validateField(fieldName, this.value);

        if (validation.isValid) {
          hideError(fieldName);
        } else {
          field.classList.remove("valid");
        }
      });

      field.addEventListener("blur", function () {
        const validation = validateField(fieldName, this.value);

        if (!validation.isValid) {
          showError(fieldName, validation.message);
        } else {
          hideError(fieldName);
        }
      });
    }
  });

  passwordToggle.addEventListener("click", function (e) {
    e.preventDefault();

    if (passwordField.type === "password") {
      passwordField.type = "text";
      this.textContent = "Nascondi";
    } else {
      passwordField.type = "password";
      this.textContent = "Mostra";
    }
  });

  form.addEventListener("submit", function (e) {
    e.preventDefault();

    successMessage.classList.remove("show");

    const isValid = validateForm();

    if (isValid) {
      successMessage.classList.add("show");

      form.reset();

      Object.keys(validationRules).forEach((fieldName) => {
        const field = document.getElementById(fieldName);
        if (field) {
          field.classList.remove("valid", "error");
        }
      });

      successMessage.scrollIntoView({ behavior: "smooth" });

      passwordField.type = "password";
      passwordToggle.textContent = "Mostra";
    }
  });

  const codiceFiscaleField = document.getElementById("codiceFiscale");
  if (codiceFiscaleField) {
    codiceFiscaleField.addEventListener("input", function () {
      this.value = this.value.toUpperCase();
    });
  }
});
