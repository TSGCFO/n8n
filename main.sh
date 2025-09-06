export PATH=$PATH:$(pwd)/node_modules/.bin
export N8N_PORT=5000
export N8N_HOST=0.0.0.0
export DB_SQLITE_POOL_SIZE=5
export N8N_RUNNERS_ENABLED=true
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
export N8N_DATABASE_TYPE=sqlite
export N8N_DATABASE_SQLITE_DATABASE=./n8n/database.sqlite

# Get the deployment URL from Replit environment
if [ -n "$REPL_SLUG" ] && [ -n "$REPL_OWNER" ]; then
  export N8N_EDITOR_BASE_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co
  export WEBHOOK_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co
else
  export N8N_EDITOR_BASE_URL=/
  export WEBHOOK_URL=/
fi

# Enable editor UI at root path
export N8N_PATH_PREFIX=/
export N8N_DISABLE_UI=false
bash persistent.sh

n8n