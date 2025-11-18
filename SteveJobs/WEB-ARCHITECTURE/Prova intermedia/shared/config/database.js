/**
 * CONFIGURAZIONE DATABASE MYSQL
 * 
 * Configurazione per connessione MySQL (da usare in fase 2)
 * Per ora commentato, gli studenti lo attiveranno quando passeranno al DB
 */

const mysql = require('mysql2/promise');
const config = require('./index');

let pool = null;

/**
 * Crea pool di connessioni MySQL
 */
const createPool = () => {
  if (!pool) {
    pool = mysql.createPool({
      host: config.database.host,
      port: config.database.port,
      user: config.database.user,
      password: config.database.password,
      database: config.database.name,
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
      enableKeepAlive: true,
      keepAliveInitialDelay: 0
    });

    console.log('✅ MySQL connection pool created');
  }

  return pool;
};

/**
 * Ottiene una connessione dal pool
 */
const getConnection = async () => {
  if (!pool) {
    createPool();
  }
  return await pool.getConnection();
};

/**
 * Esegue una query
 */
const query = async (sql, params = []) => {
  if (!pool) {
    createPool();
  }
  try {
    const [rows] = await pool.execute(sql, params);
    return rows;
  } catch (error) {
    console.error('Database query error:', error);
    throw error;
  }
};

/**
 * Testa la connessione al database
 */
const testConnection = async () => {
  try {
    if (!pool) {
      createPool();
    }
    const connection = await pool.getConnection();
    console.log('✅ Database connection successful');
    connection.release();
    return true;
  } catch (error) {
    console.error('❌ Database connection failed:', error.message);
    return false;
  }
};

/**
 * Chiude il pool di connessioni
 */
const closePool = async () => {
  if (pool) {
    await pool.end();
    pool = null;
    console.log('✅ MySQL connection pool closed');
  }
};

module.exports = {
  createPool,
  getConnection,
  query,
  testConnection,
  closePool
};

/**
 * NOTA PER GLI STUDENTI:
 * 
 * Questo file è pronto per essere usato quando passerete da JSON a MySQL.
 * 
 * Per attivarlo:
 * 1. Installare mysql2: npm install mysql2
 * 2. Configurare .env con i dati del vostro database
 * 3. Nei DAO, importare questo modulo invece di usare fs
 * 4. Sostituire le operazioni JSON con query SQL
 * 
 * Esempio di utilizzo:
 * 
 * const db = require('../../../shared/config/database');
 * 
 * // Query con parametri (prevenzione SQL injection)
 * const users = await db.query('SELECT * FROM users WHERE id = ?', [userId]);
 * 
 * // Insert
 * const result = await db.query(
 *   'INSERT INTO users (username, email, password) VALUES (?, ?, ?)',
 *   [username, email, hashedPassword]
 * );
 * 
 * // Update
 * await db.query(
 *   'UPDATE users SET username = ? WHERE id = ?',
 *   [newUsername, userId]
 * );
 * 
 * // Delete
 * await db.query('DELETE FROM users WHERE id = ?', [userId]);
 */
