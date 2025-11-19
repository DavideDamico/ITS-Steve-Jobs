const db = require('../config/database');
const Role = require('./Role');

class RoleDAO {
  static async findById(id) {
    const [rows] = await db.execute(
      'SELECT id, name, description FROM roles WHERE id = ?',
      [id]
    );
    if (rows.length === 0) return null;
    const row = rows[0];
    return new Role(row.id, row.name, row.description);
  }

  static async findByName(name) {
    const [rows] = await db.execute(
      'SELECT id, name, description FROM roles WHERE name = ?',
      [name]
    );
    if (rows.length === 0) return null;
    const row = rows[0];
    return new Role(row.id, row.name, row.description);
  }

  static async findAll() {
    const [rows] = await db.execute('SELECT id, name, description FROM roles');
    return rows.map(row => new Role(row.id, row.name, row.description));
  }
}

module.exports = RoleDAO;
