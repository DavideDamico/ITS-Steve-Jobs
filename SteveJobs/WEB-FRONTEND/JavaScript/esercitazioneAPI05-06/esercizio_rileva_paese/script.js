// Esercizio: Rileva il paese di un utente in base all’indirizzo IP
// Obiettivo:
// Creare una pagina HTML + CSS + JavaScript che:
//     1.    Permetta all’utente di inserire un indirizzo IP.
//     2.    Invii una richiesta all’API https://api.techniknews.net/ipgeo/{ip address}
//     3.    Mostri a schermo le informazioni per il paese associato all’IP inserito.
// Requisiti:
//     ·      Una input box per inserire l’indirizzo IP.
//     ·      Un bottone per inviare la richiesta.
//     ·      Una sezione di output che mostra il nome del paese restituito.
//     ·      Gestione di errori (es. IP non valido o rete non disponibile).

let input, buttonSubmit, div_output;

function isValidIP(ip) {
  const ipRegex =
    /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
  return ipRegex.test(ip);
}

async function fetchAPI(ipAddress) {
  try {
    const response = await fetch(
      `https://api.techniknews.net/ipgeo/${ipAddress}`
    );
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    return data;
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
    throw error;
  }
}

document.addEventListener("DOMContentLoaded", () => {
  input = document.getElementById("ipInput");
  buttonSubmit = document.getElementById("submitBtn");
  div_output = document.getElementById("output");

  buttonSubmit.addEventListener("click", async () => {
    const ipAddress = input.value.trim();

    if (!ipAddress) {
      div_output.innerHTML =
        '<p class="error">Per favore inserisci un indirizzo IP.</p>';
      return;
    }

    if (!isValidIP(ipAddress)) {
      div_output.innerHTML =
        '<p class="error">Per favore inserisci un indirizzo IP valido (es. 192.168.1.1).</p>';
      return;
    }

    div_output.innerHTML = '<p class="loading">Caricamento informazioni...</p>';
    buttonSubmit.disabled = true;

    try {
      const data = await fetchAPI(ipAddress);
      if (data && data.country) {
        div_output.innerHTML = `
                            <div class="country-info">
                                <h2>Informazioni Paese</h2>
                                <p><strong>Paese:</strong> ${
                                  data.country || "Non disponibile"
                                }</p>
                                <p><strong>Indirizzo IP:</strong> ${
                                  data.ip || ipAddress
                                }</p>
                                <p><strong>Regione:</strong> ${
                                  data.region || "Non disponibile"
                                }</p>
                                ${
                                  data.city
                                    ? `<p><strong>Città:</strong> ${data.city}</p>`
                                    : ""
                                }
                                ${
                                  data.isp
                                    ? `<p><strong>ISP:</strong> ${data.isp}</p>`
                                    : ""
                                }
                            </div>
                        `;
      } else {
        div_output.innerHTML =
          '<p class="error">Nessuna informazione trovata per questo IP.</p>';
      }
    } catch (error) {
      div_output.innerHTML =
        '<p class="error">Errore nel recupero dei dati. Controlla la connessione e riprova.</p>';
    } finally {
      buttonSubmit.disabled = false;
    }
  });

  input.addEventListener("keypress", (e) => {
    if (e.key === "Enter") {
      buttonSubmit.click();
    }
  });
});
