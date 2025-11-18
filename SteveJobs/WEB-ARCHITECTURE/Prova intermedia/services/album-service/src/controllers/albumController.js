/**
 * ALBUM CONTROLLER
 * 
 * CONSEGNA 3: Implementare la logica per gestire gli album
 */

const path = require('path');
const albumDAO = require('../dao/albumDAO');
const { 
  asyncHandler, 
  successResponse,
  errorResponse,
  NotFoundError,
  BadRequestError
} = require(path.join(__dirname, '../../../../shared/utils/errorHandler'));
const { get } = require(path.join(__dirname, '../../../../shared/utils/httpClient'));

/**
 * @route   GET /api/albums
 * @desc    Ottieni tutti gli album (pubblici + propri)
 * @query   userId - filtra per proprietario (opzionale)
 * 
 * TASK: Implementare logica per filtrare album visibili
 */
exports.getAllAlbums = asyncHandler(async (req, res) => {
  const { userId } = req.query;
  
  let albums;
  if (userId) {
    // Filtra per utente specifico
    albums = await albumDAO.findByUserId(userId);
  } else {
    // Ritorna tutti gli album pubblici
    albums = await albumDAO.findPublicAlbums();
  }
  
  successResponse(res, albums, 'Album recuperati con successo');
});

/**
 * @route   GET /api/albums/:id
 * @desc    Ottieni singolo album
 * 
 * TASK: Implementare con controllo visibilità
 */
exports.getAlbumById = asyncHandler(async (req, res) => {
  const { id } = req.params;
  
  const album = await albumDAO.findById(id);
  if (!album) {
    throw new NotFoundError('Album non trovato');
  }
  
  // Nella versione semplificata, tutti gli album sono pubblici
  successResponse(res, album, 'Album trovato');
});

/**
 * @route   POST /api/albums
 * @desc    Crea nuovo album
 * 
 * TASK: Implementare creazione album
 */
exports.createAlbum = asyncHandler(async (req, res) => {
  const { name, description, userId } = req.body;
  
  // Validazione
  if (!name || !userId) {
    throw new BadRequestError('Nome e userId sono obbligatori');
  }
  
  // Crea album
  const newAlbum = await albumDAO.create({ name, description, userId });
  
  successResponse(res, newAlbum, 'Album creato con successo', 201);
});

/**
 * @route   PUT /api/albums/:id
 * @desc    Aggiorna album
 * 
 * TASK: Implementare aggiornamento
 */
exports.updateAlbum = asyncHandler(async (req, res) => {
  const { id } = req.params;
  const updateData = req.body;
  
  // Rimuovi campi che non devono essere aggiornati
  delete updateData.id;
  delete updateData.createdAt;
  delete updateData.userId; // Non permettere cambio proprietario
  
  const updatedAlbum = await albumDAO.update(id, updateData);
  
  successResponse(res, updatedAlbum, 'Album aggiornato con successo');
});

/**
 * @route   DELETE /api/albums/:id
 * @desc    Elimina album
 * 
 * TASK: Implementare eliminazione
 */
exports.deleteAlbum = asyncHandler(async (req, res) => {
  const { id } = req.params;
  
  await albumDAO.delete(id);
  
  successResponse(res, null, 'Album eliminato con successo');
});

/**
 * @route   GET /api/albums/user/:userId
 * @desc    Ottieni album di un utente specifico
 * 
 * TASK: Implementare
 */
exports.getAlbumsByUser = asyncHandler(async (req, res) => {
  const { userId } = req.params;
  
  // Trova tutti gli album dell'utente
  const albums = await albumDAO.findByUserId(userId);
  
  // Nella versione semplificata, tutti gli album sono pubblici
  successResponse(res, albums, `Trovati ${albums.length} album`);
});



/**
 * ESEMPIO TEST CURL:
 * 
 * # Crea album
 * curl -X POST http://localhost:3003/api/albums \
 *   -H "Content-Type: application/json" \
 *   -d '{"name":"Vacanze 2024","description":"Foto mare","userId":1}'
 * 
 * # Ottieni tutti gli album
 * curl http://localhost:3003/api/albums
 * 
 * # Album di un utente
 * curl http://localhost:3003/api/albums/user/1
 */
