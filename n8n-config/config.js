module.exports = {
  // Database configuration for faster startup
  database: {
    type: 'sqlite',
    sqlite: {
      database: './n8n/database.sqlite',
      enableWAL: true,
      pool: {
        max: 5,
        min: 1
      }
    }
  },

  // Performance optimizations
  cache: {
    enabled: true,
    backend: 'memory'
  },

  // Health check optimizations
  healthCheck: {
    enabled: true,
    interval: 30000
  }
};