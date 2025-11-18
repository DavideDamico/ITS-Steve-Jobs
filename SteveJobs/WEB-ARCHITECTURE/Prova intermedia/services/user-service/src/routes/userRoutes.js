/**
 * USER ROUTES
 * 
 * Definisce le route per il User Service
 */

const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// GET /api/users - Lista tutti gli utenti
router.get('/', userController.getAllUsers);

// GET /api/users/search?q=term - Cerca utenti
router.get('/search', userController.searchUsers);

// GET /api/users/:id - Singolo utente
router.get('/:id', userController.getUserById);

// POST /api/users - Crea nuovo utente
router.post('/', userController.createUser);

// PUT /api/users/:id - Aggiorna utente
router.put('/:id', userController.updateUser);

// DELETE /api/users/:id - Elimina utente
router.delete('/:id', userController.deleteUser);

module.exports = router;
