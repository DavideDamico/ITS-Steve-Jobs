/**
 * IMAGE CONTROLLER
 * CONSEGNA 4: Implementare gestione immagini
 */

const path = require('path');
const imageDAO = require('../dao/imageDAO');
const { asyncHandler, successResponse, errorResponse } = require(path.join(__dirname, '../../../../shared/utils/errorHandler'));

/** GET /api/images/album/:albumId - Immagini di un album */
exports.getImagesByAlbum = asyncHandler(async (req, res) => {
  const { albumId } = req.params;
  
  const images = await imageDAO.findByAlbumId(albumId);
  
  successResponse(res, images, `Trovate ${images.length} immagini`);
});

/** GET /api/images/:id - Singola immagine */
exports.getImageById = asyncHandler(async (req, res) => {
  const { id } = req.params;
  
  const image = await imageDAO.findById(id);
  if (!image) {
    const { NotFoundError } = require(path.join(__dirname, '../../../../shared/utils/errorHandler'));
    throw new NotFoundError('Immagine non trovata');
  }
  
  successResponse(res, image, 'Immagine trovata');
});

/** POST /api/images - Crea nuova immagine con URL */
exports.createImage = asyncHandler(async (req, res) => {
  const { title, description, albumId, userId, imageUrl, tags } = req.body;
  
  // Validazione
  const { BadRequestError } = require(path.join(__dirname, '../../../../shared/utils/errorHandler'));
  if (!title || !albumId || !userId || !imageUrl) {
    throw new BadRequestError('Title, albumId, userId e imageUrl sono obbligatori');
  }
  
  // Crea immagine
  const newImage = await imageDAO.create({ 
    title, 
    description, 
    albumId, 
    userId, 
    imageUrl, 
    tags 
  });
  
  successResponse(res, newImage, 'Immagine creata con successo', 201);
});

/** PUT /api/images/:id - Aggiorna immagine */
exports.updateImage = asyncHandler(async (req, res) => {
  const { id } = req.params;
  const updateData = req.body;
  
  // Rimuovi campi che non devono essere aggiornati
  delete updateData.id;
  delete updateData.createdAt;
  delete updateData.userId; // Non permettere cambio proprietario
  delete updateData.albumId; // Non permettere cambio album
  
  const updatedImage = await imageDAO.update(id, updateData);
  
  successResponse(res, updatedImage, 'Immagine aggiornata con successo');
});

/** DELETE /api/images/:id - Elimina immagine */
exports.deleteImage = asyncHandler(async (req, res) => {
  const { id } = req.params;
  
  await imageDAO.delete(id);
  
  successResponse(res, null, 'Immagine eliminata con successo');
});

/** GET /api/images/user/:userId - Immagini di un utente */
exports.getImagesByUser = asyncHandler(async (req, res) => {
  const { userId } = req.params;
  
  const images = await imageDAO.findByUserId(userId);
  
  successResponse(res, images, `Trovate ${images.length} immagini`);
});
