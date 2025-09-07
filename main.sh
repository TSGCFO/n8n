export PATH=$PATH:$(pwd)/node_modules/.bin
export N8N_PORT=5000
export N8N_HOST=0.0.0.0
export N8N_RUNNERS_ENABLED=true
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# PostgreSQL database configuration
if [ -n "$DATABASE_URL" ]; then
  # Use DATABASE_URL if available (preferred method)
  export N8N_DATABASE_TYPE=postgresdb
  export DATABASE_URL="$DATABASE_URL"
else
  # Fallback to individual PostgreSQL variables
  export N8N_DATABASE_TYPE=postgresdb
  export N8N_DATABASE_POSTGRESDB_HOST="$PGHOST"
  export N8N_DATABASE_POSTGRESDB_PORT="$PGPORT"
  export N8N_DATABASE_POSTGRESDB_DATABASE="$PGDATABASE"
  export N8N_DATABASE_POSTGRESDB_USER="$PGUSER"
  export N8N_DATABASE_POSTGRESDB_PASSWORD="$PGPASSWORD"
fi

# PostgreSQL connection pool settings
export N8N_DATABASE_POSTGRESDB_POOL_SIZE=10
export N8N_DATABASE_LOGGING_ENABLED=false

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