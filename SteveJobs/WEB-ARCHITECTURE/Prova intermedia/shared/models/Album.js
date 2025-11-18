/**
 * MODELLO ALBUM
 * 
 * Rappresenta un album fotografico
 */

class Album {
  constructor(data = {}) {
    this.id = data.id || null;
    this.name = data.name || '';
    this.description = data.description || '';
    this.userId = data.userId || null;
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = data.updatedAt || new Date().toISOString();
  }

  /**
   * Valida i dati dell'album
   * @returns {Object} { isValid: boolean, errors: string[] }
   */
  validate() {
    const errors = [];

    if (!this.name || this.name.trim().length < 2) {
      errors.push('Nome album deve essere almeno 2 caratteri');
    }

    if (!this.userId) {
      errors.push('userId è obbligatorio');
    }



    return {
      isValid: errors.length === 0,
      errors
    };
  }

    /**
   * Verifica se un utente può visualizzare questo album
   * @param {number} requestingUserId - ID dell'utente che richiede l'accesso
   * @returns {boolean}
   */
  canView(requestingUserId) {
    // Il proprietario può sempre vedere i suoi album
    // Nella versione semplificata, tutti gli album sono pubblici
    return this.userId === requestingUserId || true;
  }

  /**
   * Converte in oggetto semplice
   */
  toJSON() {
    return {
      id: this.id,
      name: this.name,
      description: this.description,
      userId: this.userId,
      coverImageId: this.coverImageId,
      imageCount: this.imageCount,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }
}

module.exports = Album;
