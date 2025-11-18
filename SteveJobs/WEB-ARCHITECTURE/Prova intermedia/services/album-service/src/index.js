/**
 * ALBUM SERVICE
 */

const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const config = require(path.join(__dirname, '../../../shared/config'));
const { errorHandler } = require(path.join(__dirname, '../../../shared/utils/errorHandler'));
const albumRoutes = require('./routes/albumRoutes');

const app = express();
const PORT = config.ports.album;

app.use(cors(config.cors));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use((req, res, next) => {
  console.log(`[ALBUM-SERVICE] ${req.method} ${req.url}`);
  next();
});

app.get('/health', (req, res) => {
  res.json({
    status: 'UP',
    service: 'Album Service',
    timestamp: new Date().toISOString()
  });
});

app.use('/api/albums', albumRoutes);
app.use(errorHandler);

app.use((req, res) => {
  res.status(404).json({ success: false, error: 'Endpoint non trovato' });
});

app.listen(PORT, () => {
  console.log('='.repeat(50));
  console.log(`📁 ALBUM SERVICE running on port ${PORT}`);
  console.log(`   http://localhost:${PORT}`);
  console.log('='.repeat(50));
});

module.exports = app;
