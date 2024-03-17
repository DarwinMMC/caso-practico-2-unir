const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "mysql-service",
  user: "root",
  database: "counter",
  port: 3306,
  password: "password@123",
  waitForConnections: true,
  connectionLimit: 10,
  maxIdle: 10,
  idleTimeout: 10000,
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
});

module.exports = pool;
