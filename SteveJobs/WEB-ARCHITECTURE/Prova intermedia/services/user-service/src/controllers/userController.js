/**
 * USER CONTROLLER
 * 
 * Contiene la logica di business per la gestione utenti
 * 
 * CONSEGNA 2: Gli studenti devono completare questi metodi
 */

const path = require('path');
const userDAO = require('../dao/userDAO');
const { 
  asyncHandler, 
  successResponse,
  errorResponse,
  NotFoundError,
  BadRequestError
} = require(path.join(__dirname, '../../../../shared/utils/errorHandler'));

/**
 * @route   GET /api/users
 * @desc    Ottieni tutti gli utenti
 * @access  Public (per ora)
 * 
 * TASK STUDENTI: Questo metodo è già implementato come esempio
 */
exports.getAllUsers = asyncHandler(async (req, res) => {
  const users = await userDAO.findAll();
  
  // Rimuovi password dalle risposte
  const safeUsers = users.map(user => user.toSafeObject());
  
  successResponse(res, safeUsers, 'Utenti recuperati con successo');
});

/**
 * @route   GET /api/users/:id
 * @desc    Ottieni singolo utente
 * @access  Public (per ora)
 * 
 * TASK STUDENTI: Completare questo metodo
 * 1. Ottenere id dai params
 * 2. Chiamare userDAO.findById(id)
 * 3. Se non trovato, lanciare NotFoundError
 * 4. Ritornare utente (senza password) con successResponse
 */
exports.getUserById = asyncHandler(async (req, res) => {
  const { id } = req.params;
  const user = await userDAO.findById(id);
  if (!user) throw new NotFoundError('Utente non trovato');
  successResponse(res, user.toSafeObject(), 'Utente trovato');
});

/**
 * @route   POST /api/users
 * @desc    Crea nuovo utente
 * @access  Public (per ora)
 * 
 * TASK STUDENTI: Completare questo metodo
 * 1. Estrarre dati da req.body
 * 2. Validare che username, email, password siano presenti
 * 3. Chiamare userDAO.create(userData)
 * 4. Gestire errori (email/username duplicati)
 * 5. Ritornare utente creato con successResponse (status 201)
 */
exports.createUser = asyncHandler(async (req, res) => {
  const { username, email, password, firstName, lastName, bio } = req.body;
  
  // Validazione
  if (!username || !email || !password) {
    throw new BadRequestError('Username, email e password sono obbligatori');
  }
  
  const newUser = await userDAO.create({ username, email, password, firstName, lastName, bio });
  successResponse(res, newUser.toSafeObject(), 'Utente creato con successo', 201);
});

/**
 * @route   PUT /api/users/:id
 * @desc    Aggiorna utente
 * @access  Private (per ora pubblico)
 * 
 * TASK STUDENTI: Completare questo metodo
 * 1. Ottenere id dai params e dati da body
 * 2. Verificare che l'utente esista
 * 3. Chiamare userDAO.update(id, updateData)
 * 4. Ritornare utente aggiornato
 */
exports.updateUser = asyncHandler(async (req, res) => {
  const { id } = req.params;
  const updateData = req.body;
  
  // Rimuovi campi che non devono essere aggiornati
  delete updateData.id;
  delete updateData.createdAt;
  
  const updatedUser = await userDAO.update(id, updateData);
  successResponse(res, updatedUser.toSafeObject(), 'Utente aggiornato con successo');
});

/**
 * @route   DELETE /api/users/:id
 * @desc    Elimina utente
 * @access  Private (per ora pubblico)
 * 
 * TASK STUDENTI: Completare questo metodo
 * 1. Ottenere id dai params
 * 2. Verificare che l'utente esista
 * 3. Chiamare userDAO.delete(id)
 * 4. Ritornare messaggio di conferma
 */
exports.deleteUser = asyncHandler(async (req, res) => {
  const { id } = req.params;
  await userDAO.delete(id);
  successResponse(res, null, 'Utente eliminato con successo');
});

/**
 * @route   GET /api/users/search?q=termo
 * @desc    Cerca utenti
 * @access  Public
 * 
 * BONUS: Metodo opzionale per ricerca
 */
exports.searchUsers = asyncHandler(async (req, res) => {
  const { q } = req.query;
  
  if (!q || q.trim().length < 2) {
    throw new BadRequestError('Termine di ricerca deve essere almeno 2 caratteri');
  }
  
  const users = await userDAO.search(q);
  const safeUsers = users.map(user => user.toSafeObject());
  
  successResponse(res, safeUsers, `Trovati ${users.length} utenti`);
});

/**
 * SUGGERIMENTI PER GLI STUDENTI:
 * 
 * 1. Usare sempre asyncHandler per gestire errori async
 * 2. Validare SEMPRE i dati in input
 * 3. Usare le classi di errore appropriate (NotFoundError, BadRequestError, etc.)
 * 4. Non ritornare mai la password nelle risposte (usare toSafeObject())
 * 5. Testare ogni endpoint con Postman o curl
 * 
 * Esempio test con curl:
 * 
 * # Crea utente
 * curl -X POST http://localhost:3002/api/users \
 *   -H "Content-Type: application/json" \
 *   -d '{"username":"mario","email":"mario@test.com","password":"password123"}'
 * 
 * # Ottieni tutti
 * curl http://localhost:3002/api/users
 * 
 * # Ottieni singolo
 * curl http://localhost:3002/api/users/1
 * 
 * # Aggiorna
 * curl -X PUT http://localhost:3002/api/users/1 \
 *   -H "Content-Type: application/json" \
 *   -d '{"firstName":"Mario","lastName":"Rossi"}'
 * 
 * # Elimina
 * curl -X DELETE http://localhost:3002/api/users/1
 */
