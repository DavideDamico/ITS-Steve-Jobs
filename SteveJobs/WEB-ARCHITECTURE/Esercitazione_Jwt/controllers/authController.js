const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const UserDAO = require('../models/UserDAO');
const RoleDAO = require('../models/RoleDAO');
const TokenBlacklistDAO = require('../models/TokenBlacklistDAO');

class AuthController {
  // Registrazione nuovo utente
  static async register(req, res) {
    try {
      const { username, email, password } = req.body;

      // Validazione input
      if (!username || !email || !password) {
        return res.status(400).json({ error: 'Tutti i campi sono obbligatori' });
      }

      // Verifica se username o email esistono già
      const existingUser = await UserDAO.findByUsername(username);
      if (existingUser) {
        return res.status(409).json({ error: 'Username già in uso' });
      }

      const existingEmail = await UserDAO.findByEmail(email);
      if (existingEmail) {
        return res.status(409).json({ error: 'Email già in uso' });
      }

      // Hash della password
      const hashedPassword = await bcrypt.hash(password, 10);

      // Creazione utente
      const userId = await UserDAO.create(username, email, hashedPassword);

      // Assegnazione ruolo USER di default
      const userRole = await RoleDAO.findByName('USER');
      if (userRole) {
        await UserDAO.assignRole(userId, userRole.id);
      }

      res.status(201).json({ 
        message: 'Utente registrato con successo',
        userId 
      });
    } catch (error) {
      console.error('Errore durante la registrazione:', error);
      res.status(500).json({ error: 'Errore durante la registrazione' });
    }
  }

  // Login
  static async login(req, res) {
    try {
      const { username, password } = req.body;

      if (!username || !password) {
        return res.status(400).json({ error: 'Username e password sono obbligatori' });
      }

      // Trova utente
      const user = await UserDAO.findByUsername(username);
      if (!user) {
        return res.status(401).json({ error: 'Credenziali non valide' });
      }

      // Verifica password
      const isPasswordValid = await bcrypt.compare(password, user.password);
      if (!isPasswordValid) {
        return res.status(401).json({ error: 'Credenziali non valide' });
      }

      // Ottieni ruoli utente
      const roles = await UserDAO.getUserRoles(user.id);

      // Genera JWT
      const token = jwt.sign(
        { 
          userId: user.id, 
          username: user.username,
          roles: roles
        },
        process.env.JWT_SECRET,
        { expiresIn: process.env.JWT_EXPIRES_IN || '1h' }
      );

      res.json({ 
        message: 'Login effettuato con successo',
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          roles: roles
        }
      });
    } catch (error) {
      console.error('Errore durante il login:', error);
      res.status(500).json({ error: 'Errore durante il login' });
    }
  }

  // Logout (aggiunge token a blacklist)
  static async logout(req, res) {
    try {
      const token = req.token;
      const userId = req.user.id;

      // Decodifica il token per ottenere la data di scadenza
      const decoded = jwt.decode(token);
      const expiresAt = new Date(decoded.exp * 1000);

      // Aggiungi token alla blacklist
      await TokenBlacklistDAO.addToBlacklist(token, userId, expiresAt);

      res.json({ message: 'Logout effettuato con successo' });
    } catch (error) {
      console.error('Errore durante il logout:', error);
      res.status(500).json({ error: 'Errore durante il logout' });
    }
  }
}

module.exports = AuthController;
