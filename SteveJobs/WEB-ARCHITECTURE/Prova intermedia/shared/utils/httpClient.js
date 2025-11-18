/**
 * UTILITY: CLIENT HTTP
 * 
 * Helper per chiamate HTTP tra microservizi
 */

const axios = require('axios');
const config = require('../config');

/**
 * Crea un client axios configurato per un servizio
 */
const createServiceClient = (serviceUrl, timeout = 5000) => {
  return axios.create({
    baseURL: serviceUrl,
    timeout,
    headers: {
      'Content-Type': 'application/json'
    }
  });
};

/**
 * Client per User Service
 */
const userServiceClient = createServiceClient(config.services.user);

/**
 * Client per Album Service
 */
const albumServiceClient = createServiceClient(config.services.album);

/**
 * Client per Image Service
 */
const imageServiceClient = createServiceClient(config.services.image);



/**
 * Gestisce errori di chiamate tra servizi
 */
const handleServiceError = (error, serviceName) => {
  if (error.response) {
    // Il servizio ha risposto con errore
    console.error(`❌ ${serviceName} error:`, error.response.data);
    throw new Error(error.response.data.error || 'Errore nel servizio');
  } else if (error.request) {
    // Nessuna risposta ricevuta
    console.error(`❌ ${serviceName} non raggiungibile`);
    throw new Error(`${serviceName} non disponibile`);
  } else {
    // Errore nella configurazione della richiesta
    console.error(`❌ Errore chiamata a ${serviceName}:`, error.message);
    throw error;
  }
};

/**
 * Chiamata GET generica
 */
const get = async (client, endpoint, serviceName) => {
  try {
    const response = await client.get(endpoint);
    return response.data;
  } catch (error) {
    handleServiceError(error, serviceName);
  }
};

/**
 * Chiamata POST generica
 */
const post = async (client, endpoint, data, serviceName) => {
  try {
    const response = await client.post(endpoint, data);
    return response.data;
  } catch (error) {
    handleServiceError(error, serviceName);
  }
};

/**
 * Chiamata PUT generica
 */
const put = async (client, endpoint, data, serviceName) => {
  try {
    const response = await client.put(endpoint, data);
    return response.data;
  } catch (error) {
    handleServiceError(error, serviceName);
  }
};

/**
 * Chiamata DELETE generica
 */
const del = async (client, endpoint, serviceName) => {
  try {
    const response = await client.delete(endpoint);
    return response.data;
  } catch (error) {
    handleServiceError(error, serviceName);
  }
};

module.exports = {
  createServiceClient,
  userServiceClient,
  albumServiceClient,
  imageServiceClient,
  handleServiceError,
  get,
  post,
  put,
  del
};

/**
 * ESEMPIO DI UTILIZZO:
 * 
 * const { userServiceClient, get } = require('../../../shared/utils/httpClient');
 * 
 * // Ottenere un utente
 * const user = await get(userServiceClient, `/api/users/${userId}`, 'UserService');
 * 
 * // Creare un album chiamando l'album service
 * const album = await post(albumServiceClient, '/api/albums', albumData, 'AlbumService');
 */
