export PATH=$PATH:$(pwd)/node_modules/.bin
export N8N_PORT=5000
export N8N_HOST=0.0.0.0
export N8N_RUNNERS_ENABLED=true
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# PostgreSQL database configuration (using correct DB_* variables per n8n docs)
export DB_TYPE=postgresdb
export DB_POSTGRESDB_HOST="$PGHOST"
export DB_POSTGRESDB_PORT="$PGPORT"
export DB_POSTGRESDB_DATABASE="$PGDATABASE"
export DB_POSTGRESDB_USER="$PGUSER"
export DB_POSTGRESDB_PASSWORD="$PGPASSWORD"
export DB_POSTGRESDB_SCHEMA=public
export DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Connection pool settings
export DB_POSTGRESDB_POOL_SIZE=10

# Session and security configuration to fix browserId errors
export N8N_SECURE_COOKIE=false
export N8N_SESSION_COOKIE_SAME_SITE=lax
export N8N_SKIP_BROWSER_ID_CHECK=true

# Detect deployment mode and set appropriate URLs
if [ "$REPLIT_DEPLOYMENT" = "1" ]; then
  # Production deployment URL
  export N8N_EDITOR_BASE_URL=https://n-8-nio-workflow-automation-tool-1-hsadiq.replit.app
  export WEBHOOK_URL=https://n-8-nio-workflow-automation-tool-1-hsadiq.replit.app
  echo "Running in DEPLOYMENT mode - OAuth callback URL: ${N8N_EDITOR_BASE_URL}/rest/oauth2-credential/callback"
elif [ -n "$REPL_SLUG" ] && [ -n "$REPL_OWNER" ]; then
  # Development workspace URL
  export N8N_EDITOR_BASE_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co
  export WEBHOOK_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co
  echo "Running in DEVELOPMENT mode - OAuth callback URL: ${N8N_EDITOR_BASE_URL}/rest/oauth2-credential/callback"
else
  # Fallback
  export N8N_EDITOR_BASE_URL=/
  export WEBHOOK_URL=/
  echo "Running with fallback URLs"
fi

# Enable editor UI at root path
export N8N_PATH_PREFIX=/
export N8N_DISABLE_UI=false

# CORS and API configuration
export N8N_PAYLOAD_SIZE_MAX=16
export N8N_METRICS=false
export N8N_TEMPLATES_ENABLED=true

# Skip config folder setup in deployment (using PostgreSQL now)
if [ "$REPLIT_DEPLOYMENT" != "1" ]; then
  # Only run persistent.sh in development
  bash persistent.sh
fi

n8n