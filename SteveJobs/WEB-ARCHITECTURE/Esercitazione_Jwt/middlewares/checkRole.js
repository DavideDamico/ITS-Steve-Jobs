const checkRole = (...allowedRoles) => {
  return (req, res, next) => {
    if (!req.user || !req.user.roles) {
      return res.status(403).json({ error: 'Accesso negato' });
    }

    const userRoles = req.user.roles.map(role => role.name);
    const hasRole = allowedRoles.some(role => userRoles.includes(role));

    if (!hasRole) {
      return res.status(403).json({ 
        error: 'Non hai i permessi necessari per questa operazione' 
      });
    }

    next();
  };
};

module.exports = checkRole;
