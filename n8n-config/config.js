module.exports = {
  // Database configuration using PostgreSQL for persistent storage
  database: {
    type: "postgresdb",
    postgresdb: {
      connectionString: process.env.DATABASE_URL,
      pool: {
        max: 10,
        min: 2,
      },
      ssl: {
        rejectUnauthorized: false
      }
    },
  },

  // Performance optimizations
  cache: {
    enabled: true,
    backend: "memory",
  },

  // Health check optimizations
  healthCheck: {
    enabled: true,
    interval: 30000,
  },
};
