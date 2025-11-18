/**
 * USER DAO (Data Access Object)
 * 
 * Gestisce l'accesso ai dati degli utenti
 * Ora usa JSON, in futuro userà MySQL
 */

const path = require('path');
const bcrypt = require('bcrypt');
const config = require(path.join(__dirname, '../../../../shared/config'));
const User = require(path.join(__dirname, '../../../../shared/models/User'));
const {
  readJSON,
  writeJSON,
  generateId,
  findById,
  findIndexById,
  removeById
} = require(path.join(__dirname, '../../../../shared/utils/jsonHelper'));

const DATA_FILE = path.join(__dirname, '../../../data/users.json');

class UserDAO {
  /**
   * Ottieni tutti gli utenti
   */
  async findAll() {
    const jsonData = await readJSON(DATA_FILE);
    return jsonData.data.map(userData => new User(userData));
  }

  /**
   * Trova utente per ID
   */
  async findById(id) {
    const jsonData = await readJSON(DATA_FILE);
    const userData = findById(jsonData.data, id);
    return userData ? new User(userData) : null;
  }

  /**
   * Trova utente per email
   */
  async findByEmail(email) {
    const jsonData = await readJSON(DATA_FILE);
    const userData = jsonData.data.find(u => u.email === email);
    return userData ? new User(userData) : null;
  }

  /**
   * Trova utente per username
   */
  async findByUsername(username) {
    const jsonData = await readJSON(DATA_FILE);
    const userData = jsonData.data.find(u => u.username === username);
    return userData ? new User(userData) : null;
  }

  /**
   * Crea nuovo utente
   */
  async create(userData) {
    const jsonData = await readJSON(DATA_FILE);

    // Verifica duplicati
    const existingEmail = jsonData.data.find(u => u.email === userData.email);
    if (existingEmail) {
      throw new Error('Email già in uso');
    }

    const existingUsername = jsonData.data.find(u => u.username === userData.username);
    if (existingUsername) {
      throw new Error('Username già in uso');
    }

    // Hash password
    if (userData.password) {
      userData.password = await bcrypt.hash(userData.password, 10);
    }

    // Crea nuovo utente
    const newUser = new User({
      ...userData,
      id: generateId(jsonData),
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString()
    });

    // Valida
    const validation = newUser.validate();
    if (!validation.isValid) {
      throw new Error(validation.errors.join(', '));
    }

    // Salva
    jsonData.data.push(newUser.toJSON());
    await writeJSON(DATA_FILE, jsonData);

    return newUser;
  }

  /**
   * Aggiorna utente
   */
  async update(id, updateData) {
    const jsonData = await readJSON(DATA_FILE);
    const index = findIndexById(jsonData.data, id);

    if (index === -1) {
      throw new Error('Utente non trovato');
    }

    // Se si aggiorna la password, hash it
    if (updateData.password) {
      updateData.password = await bcrypt.hash(updateData.password, 10);
    }

    // Verifica email duplicata
    if (updateData.email && updateData.email !== jsonData.data[index].email) {
      const existingEmail = jsonData.data.find(u => u.email === updateData.email);
      if (existingEmail) {
        throw new Error('Email già in uso');
      }
    }

    // Verifica username duplicato
    if (updateData.username && updateData.username !== jsonData.data[index].username) {
      const existingUsername = jsonData.data.find(u => u.username === updateData.username);
      if (existingUsername) {
        throw new Error('Username già in uso');
      }
    }

    // Aggiorna dati
    const updatedUser = new User({
      ...jsonData.data[index],
      ...updateData,
      id: jsonData.data[index].id, // Mantieni ID originale
      createdAt: jsonData.data[index].createdAt, // Mantieni data creazione
      updatedAt: new Date().toISOString()
    });

    jsonData.data[index] = updatedUser.toJSON();
    await writeJSON(DATA_FILE, jsonData);

    return updatedUser;
  }

  /**
   * Elimina utente
   */
  async delete(id) {
    const jsonData = await readJSON(DATA_FILE);
    const removed = removeById(jsonData.data, id);

    if (!removed) {
      throw new Error('Utente non trovato');
    }

    await writeJSON(DATA_FILE, jsonData);
    return true;
  }

  /**
   * Verifica password
   */
  async verifyPassword(user, password) {
    return await bcrypt.compare(password, user.password);
  }

  /**
   * Cerca utenti per termine di ricerca
   */
  async search(term) {
    const jsonData = await readJSON(DATA_FILE);
    const lowerTerm = term.toLowerCase();
    
    const filtered = jsonData.data.filter(u => 
      u.username.toLowerCase().includes(lowerTerm) ||
      u.email.toLowerCase().includes(lowerTerm) ||
      (u.firstName && u.firstName.toLowerCase().includes(lowerTerm)) ||
      (u.lastName && u.lastName.toLowerCase().includes(lowerTerm))
    );

    return filtered.map(userData => new User(userData));
  }
}

module.exports = new UserDAO();

/**
 * NOTA PER GLI STUDENTI:
 * 
 * Quando passerete a MySQL, cambierete solo questo file!
 * I controller rimarranno identici perché usano le stesse funzioni.
 * 
 * Esempio conversione a MySQL:
 * 
 * const db = require('../../../shared/config/database');
 * 
 * async findById(id) {
 *   const [rows] = await db.query('SELECT * FROM users WHERE id = ?', [id]);
 *   return rows[0] ? new User(rows[0]) : null;
 * }
 * 
 * async create(userData) {
 *   const hashedPassword = await bcrypt.hash(userData.password, 10);
 *   const result = await db.query(
 *     'INSERT INTO users (username, email, password, ...) VALUES (?, ?, ?, ...)',
 *     [userData.username, userData.email, hashedPassword, ...]
 *   );
 *   return await this.findById(result.insertId);
 * }
 */
