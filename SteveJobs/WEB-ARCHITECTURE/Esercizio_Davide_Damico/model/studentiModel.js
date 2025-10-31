const fs = require('fs/promises');
const path = require('path');

const DATA_PATH = path.join(__dirname, '..', 'media_voti_anno_2025.json');

async function fetchStudentiOrdinati() {
  const fileContent = await fs.readFile(DATA_PATH, 'utf8');
  const data = JSON.parse(fileContent);

  if (!Array.isArray(data.studenti)) {
    throw new Error('Formato JSON non valido: manca l\'array studenti.');
  }

  // Ordina in base al "voto medio" in ordine decrescente
  const studentiOrdinati = [...data.studenti].sort((a, b) => b['voto medio'] - a['voto medio']);

  return { studenti: studentiOrdinati };
}

module.exports = { fetchStudentiOrdinati };
