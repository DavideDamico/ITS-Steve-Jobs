/**
 * UTILITY: GESTIONE FILE JSON
 * 
 * Funzioni helper per leggere e scrivere file JSON
 * Usate dai DAO per simulare un database
 */

const fs = require('fs').promises;
const path = require('path');

/**
 * Legge un file JSON
 * @param {string} filePath - Percorso del file
 * @returns {Object} Contenuto del file parsato
 */
const readJSON = async (filePath) => {
  try {
    const data = await fs.readFile(filePath, 'utf8');
    return JSON.parse(data);
  } catch (error) {
    if (error.code === 'ENOENT') {
      // File non esiste, ritorna struttura vuota
      return { data: [], lastId: 0 };
    }
    throw error;
  }
};

/**
 * Scrive un file JSON
 * @param {string} filePath - Percorso del file
 * @param {Object} data - Dati da scrivere
 */
const writeJSON = async (filePath, data) => {
  try {
    // Assicura che la directory esista
    const dir = path.dirname(filePath);
    await fs.mkdir(dir, { recursive: true });

    // Scrive il file con indentazione per leggibilità
    await fs.writeFile(
      filePath,
      JSON.stringify(data, null, 2),
      'utf8'
    );
  } catch (error) {
    console.error('Error writing JSON file:', error);
    throw error;
  }
};

/**
 * Verifica se un file esiste
 * @param {string} filePath - Percorso del file
 * @returns {boolean}
 */
const fileExists = async (filePath) => {
  try {
    await fs.access(filePath);
    return true;
  } catch {
    return false;
  }
};

/**
 * Inizializza un file JSON se non esiste
 * @param {string} filePath - Percorso del file
 * @param {Object} initialData - Dati iniziali
 */
const initJSON = async (filePath, initialData = { data: [], lastId: 0 }) => {
  const exists = await fileExists(filePath);
  if (!exists) {
    await writeJSON(filePath, initialData);
  }
};

/**
 * Genera un nuovo ID incrementale
 * @param {Object} jsonData - Dati JSON con campo lastId
 * @returns {number} Nuovo ID
 */
const generateId = (jsonData) => {
  const newId = (jsonData.lastId || 0) + 1;
  jsonData.lastId = newId;
  return newId;
};

/**
 * Trova un elemento per ID
 * @param {Array} array - Array di elementi
 * @param {number|string} id - ID da cercare
 * @returns {Object|null} Elemento trovato o null
 */
const findById = (array, id) => {
  return array.find(item => item.id == id) || null;
};

/**
 * Trova indice di un elemento per ID
 * @param {Array} array - Array di elementi
 * @param {number|string} id - ID da cercare
 * @returns {number} Indice (-1 se non trovato)
 */
const findIndexById = (array, id) => {
  return array.findIndex(item => item.id == id);
};

/**
 * Rimuove un elemento per ID
 * @param {Array} array - Array di elementi
 * @param {number|string} id - ID da rimuovere
 * @returns {boolean} True se rimosso, false altrimenti
 */
const removeById = (array, id) => {
  const index = findIndexById(array, id);
  if (index !== -1) {
    array.splice(index, 1);
    return true;
  }
  return false;
};

/**
 * Filtra array per campo e valore
 * @param {Array} array - Array di elementi
 * @param {string} field - Nome campo
 * @param {*} value - Valore da cercare
 * @returns {Array} Array filtrato
 */
const filterBy = (array, field, value) => {
  return array.filter(item => item[field] === value);
};

/**
 * Backup di un file JSON
 * @param {string} filePath - Percorso del file
 */
const backupJSON = async (filePath) => {
  const exists = await fileExists(filePath);
  if (exists) {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const backupPath = `${filePath}.backup.${timestamp}`;
    await fs.copyFile(filePath, backupPath);
    return backupPath;
  }
  return null;
};

module.exports = {
  readJSON,
  writeJSON,
  fileExists,
  initJSON,
  generateId,
  findById,
  findIndexById,
  removeById,
  filterBy,
  backupJSON
};
