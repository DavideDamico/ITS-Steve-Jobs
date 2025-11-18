const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const config = require(path.join(__dirname, '../../../shared/config'));
const { errorHandler } = require(path.join(__dirname, '../../../shared/utils/errorHandler'));
const imageRoutes = require('./routes/imageRoutes');

const app = express();
const PORT = config.ports.image;

app.use(cors(config.cors));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use((req, res, next) => {
  console.log(`[IMAGE-SERVICE] ${req.method} ${req.url}`);
  next();
});

app.get('/health', (req, res) => {
  res.json({ status: 'UP', service: 'Image Service', timestamp: new Date().toISOString() });
});

app.use('/api/images', imageRoutes);
app.use(errorHandler);

app.use((req, res) => {
  res.status(404).json({ success: false, error: 'Endpoint non trovato' });
});

app.listen(PORT, () => {
  console.log('='.repeat(50));
  console.log(`🖼️  IMAGE SERVICE running on port ${PORT}`);
  console.log(`   http://localhost:${PORT}`);
  console.log('='.repeat(50));
});

module.exports = app;
