/**
 * MODELLO IMMAGINE
 * 
 * Rappresenta un'immagine con URL remoto
 */

class Image {
  constructor(data = {}) {
    this.id = data.id || null;
    this.title = data.title || '';
    this.description = data.description || '';
    this.albumId = data.albumId || null; // Album di appartenenza
    this.userId = data.userId || null; // Proprietario
    this.imageUrl = data.imageUrl || ''; // URL dell'immagine
    this.tags = data.tags || []; // Array di tag
    this.views = data.views || 0;
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = data.updatedAt || new Date().toISOString();
  }

  /**
   * Valida i dati dell'immagine
   * @returns {Object} { isValid: boolean, errors: string[] }
   */
  validate() {
    const errors = [];

    if (!this.albumId) {
      errors.push('albumId è obbligatorio');
    }

    if (!this.userId) {
      errors.push('userId è obbligatorio');
    }

    if (!this.imageUrl || this.imageUrl.trim().length === 0) {
      errors.push('URL dell\'immagine è obbligatorio');
    }

    // Validazione URL
    try {
      new URL(this.imageUrl);
    } catch (e) {
      errors.push('URL dell\'immagine non valido');
    }

    return {
      isValid: errors.length === 0,
      errors
    };
  }

  /**
   * Incrementa il contatore visualizzazioni
   */
  incrementViews() {
    this.views += 1;
    this.updatedAt = new Date().toISOString();
  }

  /**
   * Aggiunge un tag
   */
  addTag(tag) {
    if (!this.tags.includes(tag)) {
      this.tags.push(tag);
      this.updatedAt = new Date().toISOString();
    }
  }

  /**
   * Rimuove un tag
   */
  removeTag(tag) {
    this.tags = this.tags.filter(t => t !== tag);
    this.updatedAt = new Date().toISOString();
  }

  /**
   * Converte in oggetto semplice
   */
  toJSON() {
    return {
      id: this.id,
      title: this.title,
      description: this.description,
      albumId: this.albumId,
      userId: this.userId,
      imageUrl: this.imageUrl,
      tags: this.tags,
      views: this.views,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }
}

module.exports = Image;
