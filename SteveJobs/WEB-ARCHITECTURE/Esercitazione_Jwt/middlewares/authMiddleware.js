const jwt = require('jsonwebtoken');
const TokenBlacklistDAO = require('../models/TokenBlacklistDAO');

const authMiddleware = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({ error: 'Token non fornito' });
    }

    const token = authHeader.substring(7);

    // Verifica se il token è in blacklist
    const isBlacklisted = await TokenBlacklistDAO.isBlacklisted(token);
    if (isBlacklisted) {
      return res.status(401).json({ error: 'Token non valido o scaduto' });
    }

    // Verifica la validità del token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    
    // Aggiungi le informazioni dell'utente alla request
    req.user = {
      id: decoded.userId,
      username: decoded.username,
      roles: decoded.roles
    };
    req.token = token;

    next();
  } catch (error) {
    if (error.name === 'JsonWebTokenError') {
      return res.status(401).json({ error: 'Token non valido' });
    }
    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({ error: 'Token scaduto' });
    }
    return res.status(500).json({ error: 'Errore durante l\'autenticazione' });
  }
};

module.exports = authMiddleware;
