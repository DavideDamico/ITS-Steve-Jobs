// Manipolare il DOM per creare un modale che si apre al clic di un bottone e si chiude con un altro clic (su una “X” o su uno sfondo scuro).

let buttonEvent = document.getElementById("btn-modale");
let modale = document.getElementById("myModale");
let span = document.getElementsByClassName("close")[0];

buttonEvent.onclick = function () {
  modale.style.display = "block";
};

span.onclick = function () {
  modale.style.display = "none";
};

window.onclick = function (event) {
  if (event.target == modale) {
    modale.style.display = "none";
  }
};
