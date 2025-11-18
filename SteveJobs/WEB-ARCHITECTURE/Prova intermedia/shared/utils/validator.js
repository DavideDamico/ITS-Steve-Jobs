/**
 * UTILITY: VALIDAZIONE DATI
 * 
 * Funzioni di validazione riutilizzabili
 */

/**
 * Valida formato email
 */
const isValidEmail = (email) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};

/**
 * Valida username
 */
const isValidUsername = (username) => {
  if (!username || typeof username !== 'string') {
    return false;
  }
  // Almeno 3 caratteri, solo lettere, numeri e underscore
  const usernameRegex = /^[a-zA-Z0-9_]{3,30}$/;
  return usernameRegex.test(username);
};

/**
 * Valida password
 */
const isValidPassword = (password) => {
  if (!password || typeof password !== 'string') {
    return false;
  }
  // Almeno 6 caratteri
  return password.length >= 6;
};

/**
 * Valida ID numerico
 */
const isValidId = (id) => {
  const numId = parseInt(id);
  return !isNaN(numId) && numId > 0;
};

/**
 * Valida stringa non vuota
 */
const isNonEmptyString = (str, minLength = 1) => {
  return typeof str === 'string' && str.trim().length >= minLength;
};

/**
 * Valida booleano
 */
const isBoolean = (value) => {
  return typeof value === 'boolean';
};

/**
 * Valida array non vuoto
 */
const isNonEmptyArray = (arr) => {
  return Array.isArray(arr) && arr.length > 0;
};

/**
 * Valida URL
 */
const isValidURL = (url) => {
  try {
    new URL(url);
    return true;
  } catch {
    return false;
  }
};

/**
 * Valida estensione file immagine
 */
const isValidImageExtension = (filename) => {
  const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
  const ext = filename.split('.').pop().toLowerCase();
  return allowedExtensions.includes(ext);
};

/**
 * Sanitizza stringa (rimuove caratteri pericolosi)
 */
const sanitizeString = (str) => {
  if (typeof str !== 'string') {
    return '';
  }
  // Rimuove caratteri speciali pericolosi
  return str.replace(/[<>\"']/g, '').trim();
};

/**
 * Valida oggetto con campi richiesti
 */
const hasRequiredFields = (obj, requiredFields) => {
  if (!obj || typeof obj !== 'object') {
    return { isValid: false, missing: requiredFields };
  }

  const missing = requiredFields.filter(field => {
    return obj[field] === undefined || obj[field] === null || obj[field] === '';
  });

  return {
    isValid: missing.length === 0,
    missing
  };
};

/**
 * Valida lunghezza stringa
 */
const isValidLength = (str, min, max) => {
  if (typeof str !== 'string') {
    return false;
  }
  const len = str.trim().length;
  return len >= min && len <= max;
};

module.exports = {
  isValidEmail,
  isValidUsername,
  isValidPassword,
  isValidId,
  isNonEmptyString,
  isBoolean,
  isNonEmptyArray,
  isValidURL,
  isValidImageExtension,
  sanitizeString,
  hasRequiredFields,
  isValidLength
};
