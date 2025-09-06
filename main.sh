export PATH=$PATH:$(pwd)/node_modules/.bin
export N8N_PORT=5000
export DB_SQLITE_POOL_SIZE=5
export N8N_RUNNERS_ENABLED=true
export N8N_BLOCK_ENV_ACCESS_IN_NODE=false
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
export N8N_DATABASE_TYPE=sqlite
export N8N_DATABASE_SQLITE_DATABASE=./n8n/database.sqlite
export N8N_HEALTH_CHECK_ENABLED=true
bash persistent.sh

# Health check in background to signal readiness
(
  # Initial short wait for n8n to start
  sleep 10
  
  # Quick health check for deployment
  for i in {1..90}; do
    # Check if curl is available (should be since it's in package.json)
    if command -v curl >/dev/null 2>&1; then
      response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/ 2>/dev/null || echo "000")
      if [[ "$response" =~ ^(200|301|302)$ ]]; then
        echo "n8n health check passed (HTTP $response)"
        # Write health status to file for deployment monitoring
        echo "healthy" > /tmp/n8n_status
        exit 0
      fi
    else
      # Fallback to wget if curl is not available
      if command -v wget >/dev/null 2>&1; then
        if wget -q --spider http://localhost:5000/ 2>/dev/null; then
          echo "n8n health check passed (using wget)"
          echo "healthy" > /tmp/n8n_status
          exit 0
        fi
      fi
    fi
    
    # More frequent checks initially, then slower
    if [ $i -lt 30 ]; then
      sleep 1
    else
      sleep 2
    fi
  done
  echo "n8n health check failed after 90 attempts"
  echo "unhealthy" > /tmp/n8n_status
) &

n8n