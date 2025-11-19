const db = require('../config/database');

class TokenBlacklistDAO {
  static async addToBlacklist(token, userId, expiresAt) {
    await db.execute(
      'INSERT INTO token_blacklist (token, user_id, expires_at) VALUES (?, ?, ?)',
      [token, userId, expiresAt]
    );
  }

  static async isBlacklisted(token) {
    const [rows] = await db.execute(
      'SELECT id FROM token_blacklist WHERE token = ? AND expires_at > NOW()',
      [token]
    );
    return rows.length > 0;
  }

  static async cleanExpiredTokens() {
    await db.execute('DELETE FROM token_blacklist WHERE expires_at <= NOW()');
  }
}

module.exports = TokenBlacklistDAO;
