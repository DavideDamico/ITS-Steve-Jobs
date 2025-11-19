const UserDAO = require('../models/UserDAO');
const bcrypt = require('bcrypt');

class UserController {
  // Ottieni tutti gli utenti
  static async getAllUsers(req, res) {
    try {
      const users = await UserDAO.findAll();
      res.json({ users });
    } catch (error) {
      console.error('Errore durante il recupero degli utenti:', error);
      res.status(500).json({ error: 'Errore durante il recupero degli utenti' });
    }
  }

  // Ottieni utente per ID
  static async getUserById(req, res) {
    try {
      const { id } = req.params;
      const user = await UserDAO.findById(id);

      if (!user) {
        return res.status(404).json({ error: 'Utente non trovato' });
      }

      const roles = await UserDAO.getUserRoles(user.id);

      res.json({ 
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          roles: roles
        }
      });
    } catch (error) {
      console.error('Errore durante il recupero dell\'utente:', error);
      res.status(500).json({ error: 'Errore durante il recupero dell\'utente' });
    }
  }

  // Aggiorna utente
  static async updateUser(req, res) {
    try {
      const { id } = req.params;
      const { username, email } = req.body;

      // Verifica che l'utente esista
      const user = await UserDAO.findById(id);
      if (!user) {
        return res.status(404).json({ error: 'Utente non trovato' });
      }

      // Aggiorna utente
      const updated = await UserDAO.update(id, username || user.username, email || user.email);

      if (updated) {
        res.json({ message: 'Utente aggiornato con successo' });
      } else {
        res.status(500).json({ error: 'Errore durante l\'aggiornamento' });
      }
    } catch (error) {
      console.error('Errore durante l\'aggiornamento dell\'utente:', error);
      res.status(500).json({ error: 'Errore durante l\'aggiornamento dell\'utente' });
    }
  }

  // Elimina utente (solo ADMIN)
  static async deleteUser(req, res) {
    try {
      const { id } = req.params;

      // Verifica che l'utente esista
      const user = await UserDAO.findById(id);
      if (!user) {
        return res.status(404).json({ error: 'Utente non trovato' });
      }

      // Elimina utente
      const deleted = await UserDAO.delete(id);

      if (deleted) {
        res.json({ message: 'Utente eliminato con successo' });
      } else {
        res.status(500).json({ error: 'Errore durante l\'eliminazione' });
      }
    } catch (error) {
      console.error('Errore durante l\'eliminazione dell\'utente:', error);
      res.status(500).json({ error: 'Errore durante l\'eliminazione dell\'utente' });
    }
  }
}

module.exports = UserController;
