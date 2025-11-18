/**
 * CONFIGURAZIONE SERVIZI
 * 
 * Centralizza le configurazioni di tutti i microservizi
 */

module.exports = {
  // Porte dei servizi
  ports: {
    gateway: process.env.GATEWAY_PORT || 3000,
    user: process.env.USER_SERVICE_PORT || 3002,
    album: process.env.ALBUM_SERVICE_PORT || 3003,
    image: process.env.IMAGE_SERVICE_PORT || 3004
  },

  // URL dei servizi (per comunicazione interna)
  services: {
    user: process.env.USER_SERVICE_URL || 'http://localhost:3002',
    album: process.env.ALBUM_SERVICE_URL || 'http://localhost:3003',
    image: process.env.IMAGE_SERVICE_URL || 'http://localhost:3004'
  },

  // Percorso dati JSON
  dataPath: process.env.DATA_PATH || './data',

  // CORS
  cors: {
    origin: process.env.CORS_ORIGIN || '*',
    credentials: true
  },

  // JWT (per il futuro)
  jwt: {
    secret: process.env.JWT_SECRET || 'your-super-secret-key-change-in-production',
    expiresIn: process.env.JWT_EXPIRES_IN || '24h'
  },

    // Immagini gestite via URL - no upload necessario,

  // Database (per il futuro)
  database: {
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT) || 3306,
    name: process.env.DB_NAME || 'photogallery',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || 'password'
  },

  // Ambiente
  env: process.env.NODE_ENV || 'development',
  isDevelopment: process.env.NODE_ENV === 'development',
  isProduction: process.env.NODE_ENV === 'production'
};
