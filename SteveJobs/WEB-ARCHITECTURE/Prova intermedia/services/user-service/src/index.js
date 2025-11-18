/**
 * USER SERVICE
 * 
 * Microservizio per la gestione degli utenti
 */

const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const config = require(path.join(__dirname, '../../../shared/config'));
const { errorHandler } = require(path.join(__dirname, '../../../shared/utils/errorHandler'));
const userRoutes = require('./routes/userRoutes');

const app = express();
const PORT = config.ports.user;

// Middleware
app.use(cors(config.cors));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Logging
app.use((req, res, next) => {
  console.log(`[USER-SERVICE] ${req.method} ${req.url}`);
  next();
});

// Health check
app.get('/health', (req, res) => {
  res.json({
    status: 'UP',
    service: 'User Service',
    timestamp: new Date().toISOString()
  });
});

// Routes
app.use('/api/users', userRoutes);

// Error handling
app.use(errorHandler);

// 404
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Endpoint non trovato'
  });
});

// Start server
app.listen(PORT, () => {
  console.log('='.repeat(50));
  console.log(`👤 USER SERVICE running on port ${PORT}`);
  console.log(`   http://localhost:${PORT}`);
  console.log('='.repeat(50));
});

module.exports = app;
