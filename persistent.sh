#!/bin/bash

PERSISTANT_CONFIG_FOLDER=$(pwd)/n8n-config
ORIGINAL_CONFIG_FOLDER=~/.n8n

echo "Loading..."

# Remove existing config folder and symlink
rm -r -f $ORIGINAL_CONFIG_FOLDER

# Create persistent config directory with proper permissions
mkdir -p $PERSISTANT_CONFIG_FOLDER
chmod 755 $PERSISTANT_CONFIG_FOLDER

# Ensure the directory exists and is writable
if [ ! -d "$PERSISTANT_CONFIG_FOLDER" ]; then
    echo "ERROR: Failed to create config directory: $PERSISTANT_CONFIG_FOLDER"
    exit 1
fi

if [ ! -w "$PERSISTANT_CONFIG_FOLDER" ]; then
    echo "ERROR: Config directory is not writable: $PERSISTANT_CONFIG_FOLDER"
    exit 1
fi

# Creating symlink between persistent config folder and original config folder
ln -s $PERSISTANT_CONFIG_FOLDER $ORIGINAL_CONFIG_FOLDER

# Verify symlink was created successfully
if [ -L "$ORIGINAL_CONFIG_FOLDER" ] && [ -e "$ORIGINAL_CONFIG_FOLDER" ]; then
    echo "Config directory setup completed successfully"
    echo "Symlink verification: SUCCESS"
    # Set proper permissions for n8n config
    chmod -R 755 $PERSISTANT_CONFIG_FOLDER 2>/dev/null || true
else
    echo "ERROR: Failed to create symlink to config directory"
    exit 1
fi