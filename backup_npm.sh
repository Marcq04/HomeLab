#!/bin/bash

# Create a backup of Nginx Proxy Manager (NPM) Docker volumes
BACKUP_DIR="/home/$USER/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")

# Create backup folder if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Compress NPM Docker volumes into a timestamped archive
echo "Starting NPM volume backup..."
tar -czf "$BACKUP_DIR/npm_backup_$TIMESTAMP.tar.gz" /var/lib/docker/volumes/npm-data /var/lib/docker/volumes/npm-letsencrypt

echo "Backup complete: $BACKUP_DIR/npm_backup_$TIMESTAMP.tar.gz"
