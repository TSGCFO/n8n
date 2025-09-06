export PATH=$PATH:$(pwd)/node_modules/.bin
export N8N_PORT=5000
export N8N_HOST=0.0.0.0
export DB_SQLITE_POOL_SIZE=5
export N8N_RUNNERS_ENABLED=true
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
export N8N_DATABASE_TYPE=sqlite
export N8N_DATABASE_SQLITE_DATABASE=./n8n/database.sqlite
export N8N_EDITOR_BASE_URL=${REPL_SLUG}.${REPL_OWNER}.repl.co
bash persistent.sh

n8n