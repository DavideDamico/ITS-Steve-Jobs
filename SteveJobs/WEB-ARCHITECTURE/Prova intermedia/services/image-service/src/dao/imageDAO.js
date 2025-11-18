/**
 * IMAGE DAO
 * CONSEGNA 4: Completare i metodi
 */

const path = require('path');
const Image = require(path.join(__dirname, '../../../../shared/models/Image'));
const { readJSON, writeJSON, generateId, findById, removeById, filterBy } = require(path.join(__dirname, '../../../../shared/utils/jsonHelper'));

const DATA_FILE = path.join(__dirname, '../../../data/images.json');

class ImageDAO {
  async findAll() {
    const jsonData = await readJSON(DATA_FILE);
    return jsonData.data.map(data => new Image(data));
  }

  async findById(id) {
    const jsonData = await readJSON(DATA_FILE);
    const imageData = findById(jsonData.data, id);
    return imageData ? new Image(imageData) : null;
  }

  /** TASK: Trova immagini di un album */
  async findByAlbumId(albumId) {
    const jsonData = await readJSON(DATA_FILE);
    const filtered = filterBy(jsonData.data, 'albumId', albumId);
    return filtered.map(imageData => new Image(imageData));
  }

  /** TASK: Trova immagini di un utente */
  async findByUserId(userId) {
    const jsonData = await readJSON(DATA_FILE);
    const filtered = filterBy(jsonData.data, 'userId', userId);
    return filtered.map(imageData => new Image(imageData));
  }

  /** TASK: Crea nuova immagine */
  async create(imageData) {
    const jsonData = await readJSON(DATA_FILE);

    // Crea nuova immagine
    const newImage = new Image({
      ...imageData,
      id: generateId(jsonData),
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      views: 0
    });

    // Valida
    const validation = newImage.validate();
    if (!validation.isValid) {
      throw new Error(validation.errors.join(', '));
    }

    // Salva
    jsonData.data.push(newImage.toJSON());
    await writeJSON(DATA_FILE, jsonData);

    return newImage;
  }

  /** TASK: Aggiorna immagine */
  async update(id, updateData) {
    const jsonData = await readJSON(DATA_FILE);
    const imageData = findById(jsonData.data, id);

    if (!imageData) {
      throw new Error('Immagine non trovata');
    }

    // Trova indice
    const index = jsonData.data.findIndex(img => img.id === parseInt(id));

    // Aggiorna dati
    const updatedImage = new Image({
      ...imageData,
      ...updateData,
      id: imageData.id, // Mantieni ID originale
      createdAt: imageData.createdAt, // Mantieni data creazione
      updatedAt: new Date().toISOString()
    });

    jsonData.data[index] = updatedImage.toJSON();
    await writeJSON(DATA_FILE, jsonData);

    return updatedImage;
  }

  /** TASK: Elimina immagine */
  async delete(id) {
    const jsonData = await readJSON(DATA_FILE);
    const removed = removeById(jsonData.data, id);

    if (!removed) {
      throw new Error('Immagine non trovata');
    }

    await writeJSON(DATA_FILE, jsonData);
    return true;
  }

  /** BONUS: Incrementa visualizzazioni */
  async incrementViews(id) {
    const image = await this.findById(id);
    if (image) {
      image.incrementViews();
      await this.update(id, { views: image.views });
    }
  }
}

module.exports = new ImageDAO();
