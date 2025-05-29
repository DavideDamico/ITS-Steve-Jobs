// Esercizio 2: To-Do List dinamica con eventi, delegazione e custom logging

// Obiettivo:
// Costruisci una semplice applicazione di To-Do List che permetta all’utente di aggiungere, completare e rimuovere task in modo dinamico. Dovrai utilizzare HTML e JavaScript vanilla, con un focus sull’uso avanzato degli eventi, incluso preventDefault(), stopPropagation() e la delegazione degli eventi.
//
// Specifiche tecniche:
//     Struttura HTML:
// •	L’interfaccia deve includere:
// •	Un form con un campo input per scrivere il task e un pulsante per aggiungerlo.
// •	Una lista dove verranno mostrati i task.
// •	Un contenitore dove verranno stampati i log delle azioni svolte.

//     Aggiunta dei task:
// •	Al submit del form, blocca il comportamento di default.
// •	Crea dinamicamente un elemento <li> contenente:
// o	    Il testo del task.
// o	    Un pulsante per rimuovere la task.
// •	Aggiungi il nuovo task in fondo alla lista.
// •	Mostra un messaggio nel log: Task “nome-task” creata.

//     Completamento dei task:
// •	Usando la delegazione eventi, intercetta il click sullo sul task.
// •	Alterna la classe CSS completed per marcare il task come fatto/non fatto.
// •	Logga nel contenitore un messaggio del tipo:
// o	    Task “nome-task” → Completato oppure Task “nome-task” → Non completato.

//     Rimozione dei task
// •	Sempre tramite delegazione eventi, intercetta il click sul bottone Rimuovi.
// •	Usa stopPropagation() per bloccare la propagazione dell’evento al <li>.
// •	Rimuovi il task dalla lista.
// •	Logga nel contenitore: Task “nome-task” rimosso.

const form = document.getElementById("myForm");
const error = document.querySelector("#error-message");
const btn_submit = document.getElementById("btn-submit");
const taskList = document.getElementById("taskList");
const logList = document.getElementById("logList");

form.addEventListener("submit", function (event) {
  const inputField = document.querySelector("#taskInput");
  const li = document.createElement("li");
  const p = document.createElement("p");
  const button = document.createElement("button");
  event.preventDefault();

  if (inputField.value.trim() === "") {
    error.textContent = "Write a task in the input field";
  } else {
    // Const li e p
    p.textContent = inputField.value;
    taskList.appendChild(li);
    li.appendChild(p);
    p.style.marginTop = "12px";
    p.setAttribute("class", "not-completed");
    li.setAttribute("class", "fix-flex");

    // Const button
    button.textContent = "Remove";
    button.style.marginLeft = "10px";
    button.setAttribute("class", "btn danger");
    li.appendChild(button);

    // Const p log
    const logMessageAdd = document.createElement("p");
    logList.appendChild(logMessageAdd);
    logMessageAdd.textContent = `Task ${inputField.value} creata`;

    // Reset input
    inputField.value = "";
  }

  // Evento rimozione
  button.addEventListener("click", () => {
    const logMessageRemove = document.createElement("p");
    logList.appendChild(logMessageRemove);
    logMessageRemove.textContent = `Task ${li.firstChild.textContent} rimossa`;
    button.parentElement.remove();
  });

  // Evento completamento o non completamento
  p.addEventListener("click", () => {
    if (p.classList.contains("not-completed")) {
      p.removeAttribute("class", "not-completed");
      p.setAttribute("class", "completed");
      const logMessageDone = document.createElement("p");
      logList.appendChild(logMessageDone);
      logMessageDone.textContent = `Task ${li.firstChild.textContent} completata`;
    } else {
      p.removeAttribute("class", "completed");
      p.setAttribute("class", "not-completed");
      const logMessageDone = document.createElement("p");
      logList.appendChild(logMessageDone);
      logMessageDone.textContent = `Task ${li.firstChild.textContent} non completata`;
    }
  });
});
