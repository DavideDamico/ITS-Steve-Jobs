/**
 * Export di tutti i modelli
 * 
 * Importare con: const { User, Album, Image, ... } = require('./models');
 */

const User = require('./User');
const Album = require('./Album');
const Image = require('./Image');

module.exports = {
  User,
  Album,
  Image
};
