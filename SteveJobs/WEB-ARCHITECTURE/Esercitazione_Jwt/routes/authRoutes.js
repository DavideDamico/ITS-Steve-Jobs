const express = require('express');
const router = express.Router();
const AuthController = require('../controllers/authController');
const authMiddleware = require('../middlewares/authMiddleware');

// Rotte pubbliche
router.post('/register', AuthController.register);
router.post('/login', AuthController.login);

// Rotte protette
router.post('/logout', authMiddleware, AuthController.logout);

module.exports = router;
