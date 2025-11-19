const validateEmail = (email) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};

const validatePassword = (password) => {
  // Password deve essere almeno 6 caratteri
  return password && password.length >= 6;
};

const validateUsername = (username) => {
  // Username deve essere almeno 3 caratteri
  return username && username.length >= 3;
};

module.exports = {
  validateEmail,
  validatePassword,
  validateUsername
};
