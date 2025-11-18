/**
 * UTILITY: GESTIONE ERRORI
 * 
 * Classi e funzioni per gestione centralizzata degli errori
 */

/**
 * Classe base per errori applicativi
 */
class AppError extends Error {
  constructor(message, statusCode = 500, isOperational = true) {
    super(message);
    this.statusCode = statusCode;
    this.isOperational = isOperational;
    this.timestamp = new Date().toISOString();
    Error.captureStackTrace(this, this.constructor);
  }
}

/**
 * Errore 400 - Bad Request
 */
class BadRequestError extends AppError {
  constructor(message = 'Richiesta non valida') {
    super(message, 400);
  }
}

/**
 * Errore 401 - Unauthorized
 */
class UnauthorizedError extends AppError {
  constructor(message = 'Non autorizzato') {
    super(message, 401);
  }
}

/**
 * Errore 403 - Forbidden
 */
class ForbiddenError extends AppError {
  constructor(message = 'Accesso negato') {
    super(message, 403);
  }
}

/**
 * Errore 404 - Not Found
 */
class NotFoundError extends AppError {
  constructor(message = 'Risorsa non trovata') {
    super(message, 404);
  }
}

/**
 * Errore 409 - Conflict
 */
class ConflictError extends AppError {
  constructor(message = 'Conflitto con risorsa esistente') {
    super(message, 409);
  }
}

/**
 * Errore 500 - Internal Server Error
 */
class InternalServerError extends AppError {
  constructor(message = 'Errore interno del server') {
    super(message, 500);
  }
}

/**
 * Middleware Express per gestione errori globale
 */
const errorHandler = (err, req, res, next) => {
  let error = { ...err };
  error.message = err.message;

  // Log errore in development
  if (process.env.NODE_ENV === 'development') {
    console.error('❌ Error:', {
      message: err.message,
      stack: err.stack,
      statusCode: err.statusCode
    });
  }

  // Errori operazionali attesi
  if (err.isOperational) {
    return res.status(err.statusCode || 500).json({
      success: false,
      error: err.message,
      ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
    });
  }

  // Errori non operazionali (bug, errori imprevisti)
  console.error('💥 CRITICAL ERROR:', err);
  return res.status(500).json({
    success: false,
    error: 'Qualcosa è andato storto',
    ...(process.env.NODE_ENV === 'development' && { 
      originalError: err.message,
      stack: err.stack 
    })
  });
};

/**
 * Wrapper async per gestire errori in route async
 */
const asyncHandler = (fn) => {
  return (req, res, next) => {
    Promise.resolve(fn(req, res, next)).catch(next);
  };
};

/**
 * Crea risposta di successo standardizzata
 */
const successResponse = (res, data, message = 'Operazione completata', statusCode = 200) => {
  return res.status(statusCode).json({
    success: true,
    message,
    data
  });
};

/**
 * Crea risposta di errore standardizzata
 */
const errorResponse = (res, message, statusCode = 500, errors = null) => {
  const response = {
    success: false,
    error: message
  };

  if (errors) {
    response.errors = errors;
  }

  return res.status(statusCode).json(response);
};

module.exports = {
  AppError,
  BadRequestError,
  UnauthorizedError,
  ForbiddenError,
  NotFoundError,
  ConflictError,
  InternalServerError,
  errorHandler,
  asyncHandler,
  successResponse,
  errorResponse
};
