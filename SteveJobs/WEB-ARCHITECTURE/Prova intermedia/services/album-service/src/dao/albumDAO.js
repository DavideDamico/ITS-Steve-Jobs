/**
 * ALBUM DAO
 * 
 * CONSEGNA 3: Completare i metodi per gestire gli album
 */

const path = require('path');
const config = require(path.join(__dirname, '../../../../shared/config'));
const Album = require(path.join(__dirname, '../../../../shared/models/Album'));
const {
  readJSON,
  writeJSON,
  generateId,
  findById,
  findIndexById,
  removeById,
  filterBy
} = require(path.join(__dirname, '../../../../shared/utils/jsonHelper'));

const DATA_FILE = path.join(__dirname, '../../../data/albums.json');

class AlbumDAO {
  /**
   * Ottieni tutti gli album
   */
  async findAll() {
    const jsonData = await readJSON(DATA_FILE);
    return jsonData.data.map(albumData => new Album(albumData));
  }

  /**
   * Trova album per ID
   */
  async findById(id) {
    const jsonData = await readJSON(DATA_FILE);
    const albumData = findById(jsonData.data, id);
    return albumData ? new Album(albumData) : null;
  }

  /**
   * TASK: Trova tutti gli album di un utente
   * @param {number} userId - ID utente
   */
  async findByUserId(userId) {
    const jsonData = await readJSON(DATA_FILE);
    const filtered = filterBy(jsonData.data, 'userId', userId);
    return filtered.map(albumData => new Album(albumData));
  }

  /**
   * TASK: Trova album pubblici
   */
  async findPublicAlbums() {
    // Nella versione semplificata, tutti gli album sono pubblici
    return await this.findAll();
  }

  /**
   * TASK: Crea nuovo album
   */
  async create(albumData) {
    const jsonData = await readJSON(DATA_FILE);

    // Crea nuovo album
    const newAlbum = new Album({
      ...albumData,
      id: generateId(jsonData),
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      imageCount: 0
    });

    // Valida
    const validation = newAlbum.validate();
    if (!validation.isValid) {
      throw new Error(validation.errors.join(', '));
    }

    // Salva
    jsonData.data.push(newAlbum.toJSON());
    await writeJSON(DATA_FILE, jsonData);

    return newAlbum;
  }

  /**
   * TASK: Aggiorna album
   */
  async update(id, updateData) {
    const jsonData = await readJSON(DATA_FILE);
    const index = findIndexById(jsonData.data, id);

    if (index === -1) {
      throw new Error('Album non trovato');
    }

    // Aggiorna dati
    const updatedAlbum = new Album({
      ...jsonData.data[index],
      ...updateData,
      id: jsonData.data[index].id, // Mantieni ID originale
      createdAt: jsonData.data[index].createdAt, // Mantieni data creazione
      updatedAt: new Date().toISOString()
    });

    jsonData.data[index] = updatedAlbum.toJSON();
    await writeJSON(DATA_FILE, jsonData);

    return updatedAlbum;
  }

  /**
   * TASK: Elimina album
   */
  async delete(id) {
    const jsonData = await readJSON(DATA_FILE);
    const removed = removeById(jsonData.data, id);

    if (!removed) {
      throw new Error('Album non trovato');
    }

    await writeJSON(DATA_FILE, jsonData);
    return true;
  }

  /**
   * BONUS: Incrementa conteggio immagini
   */
  async incrementImageCount(id) {
    const album = await this.findById(id);
    if (album) {
      album.imageCount += 1;
      await this.update(id, { imageCount: album.imageCount });
    }
  }

  /**
   * BONUS: Decrementa conteggio immagini
   */
  async decrementImageCount(id) {
    const album = await this.findById(id);
    if (album && album.imageCount > 0) {
      album.imageCount -= 1;
      await this.update(id, { imageCount: album.imageCount });
    }
  }
}

module.exports = new AlbumDAO();
