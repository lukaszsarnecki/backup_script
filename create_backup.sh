#!/bin/bash

# Paths
SRC_DIR="/path/to/source/folder"  # Source directory to back up
BACKUP_DIR="/path/to/backup/folder"  # Destination directory for backups
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Check if the backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Create the backup
tar -czf "$BACKUP_FILE" "$SRC_DIR"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup was successfully created: $BACKUP_FILE"
else
  echo "Error while creating the backup."
fi
