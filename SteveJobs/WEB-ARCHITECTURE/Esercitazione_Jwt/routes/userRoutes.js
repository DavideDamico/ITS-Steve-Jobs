const express = require('express');
const router = express.Router();
const UserController = require('../controllers/userController');
const authMiddleware = require('../middlewares/authMiddleware');
const checkRole = require('../middlewares/checkRole');

// Tutte le rotte richiedono autenticazione
router.use(authMiddleware);

// Ottieni tutti gli utenti
router.get('/', UserController.getAllUsers);

// Ottieni utente per ID
router.get('/:id', UserController.getUserById);

// Aggiorna utente
router.put('/:id', UserController.updateUser);

// Elimina utente (solo ADMIN)
router.delete('/:id', checkRole('ADMIN'), UserController.deleteUser);

module.exports = router;
