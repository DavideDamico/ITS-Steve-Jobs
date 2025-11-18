/**
 * MODELLO UTENTE
 * 
 * Rappresenta un utente dell'applicazione
 */

class User {
  constructor(data = {}) {
    this.id = data.id || null;
    this.username = data.username || '';
    this.email = data.email || '';
    this.password = data.password || ''; // Hash bcrypt
    this.firstName = data.firstName || '';
    this.lastName = data.lastName || '';
    this.bio = data.bio || '';
    this.profileImage = data.profileImage || null;
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = data.updatedAt || new Date().toISOString();
  }

  /**
   * Valida i dati dell'utente
   * @returns {Object} { isValid: boolean, errors: string[] }
   */
  validate() {
    const errors = [];

    if (!this.username || this.username.trim().length < 3) {
      errors.push('Username deve essere almeno 3 caratteri');
    }

    if (!this.email || !this.isValidEmail(this.email)) {
      errors.push('Email non valida');
    }

    if (!this.password || this.password.length < 6) {
      errors.push('Password deve essere almeno 6 caratteri');
    }

    return {
      isValid: errors.length === 0,
      errors
    };
  }

  /**
   * Verifica validità email
   */
  isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  /**
   * Ritorna l'oggetto senza la password (per risposte API)
   */
  toSafeObject() {
    const { password, ...safeUser } = this;
    return safeUser;
  }

  /**
   * Converte in oggetto semplice
   */
  toJSON() {
    return {
      id: this.id,
      username: this.username,
      email: this.email,
      password: this.password,
      firstName: this.firstName,
      lastName: this.lastName,
      bio: this.bio,
      profileImage: this.profileImage,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }
}

module.exports = User;
