const db = require('../config/database');
const User = require('./User');

class UserDAO {
  static async create(username, email, hashedPassword) {
    const [result] = await db.execute(
      'INSERT INTO users (username, email, password) VALUES (?, ?, ?)',
      [username, email, hashedPassword]
    );
    return result.insertId;
  }

  static async findById(id) {
    const [rows] = await db.execute(
      'SELECT id, username, email, password FROM users WHERE id = ?',
      [id]
    );
    if (rows.length === 0) return null;
    const row = rows[0];
    return new User(row.id, row.username, row.email, row.password);
  }

  static async findByUsername(username) {
    const [rows] = await db.execute(
      'SELECT id, username, email, password FROM users WHERE username = ?',
      [username]
    );
    if (rows.length === 0) return null;
    const row = rows[0];
    return new User(row.id, row.username, row.email, row.password);
  }

  static async findByEmail(email) {
    const [rows] = await db.execute(
      'SELECT id, username, email, password FROM users WHERE email = ?',
      [email]
    );
    if (rows.length === 0) return null;
    const row = rows[0];
    return new User(row.id, row.username, row.email, row.password);
  }

  static async findAll() {
    const [rows] = await db.execute(
      'SELECT id, username, email FROM users'
    );
    return rows.map(row => new User(row.id, row.username, row.email, null));
  }

  static async update(id, username, email) {
    const [result] = await db.execute(
      'UPDATE users SET username = ?, email = ? WHERE id = ?',
      [username, email, id]
    );
    return result.affectedRows > 0;
  }

  static async delete(id) {
    const [result] = await db.execute(
      'DELETE FROM users WHERE id = ?',
      [id]
    );
    return result.affectedRows > 0;
  }

  static async assignRole(userId, roleId) {
    await db.execute(
      'INSERT INTO user_roles (user_id, role_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE user_id=user_id',
      [userId, roleId]
    );
  }

  static async getUserRoles(userId) {
    const [rows] = await db.execute(
      'SELECT r.id, r.name, r.description FROM roles r INNER JOIN user_roles ur ON r.id = ur.role_id WHERE ur.user_id = ?',
      [userId]
    );
    return rows;
  }
}

module.exports = UserDAO;
