/**
 * ALBUM ROUTES
 */

const express = require('express');
const router = express.Router();
const albumController = require('../controllers/albumController');

// GET /api/albums - Lista album (pubblici o filtrati)
router.get('/', albumController.getAllAlbums);

// GET /api/albums/user/:userId - Album di un utente
router.get('/user/:userId', albumController.getAlbumsByUser);

// GET /api/albums/:id - Singolo album
router.get('/:id', albumController.getAlbumById);

// POST /api/albums - Crea album
router.post('/', albumController.createAlbum);

// PUT /api/albums/:id - Aggiorna album
router.put('/:id', albumController.updateAlbum);

// DELETE /api/albums/:id - Elimina album
router.delete('/:id', albumController.deleteAlbum);

module.exports = router;
