#!/bin/bash

# Backup restoration configuration
BACKUP_FILE="/path/to/backup/backup.tar.gz"  # Path to the backup file
RESTORE_DIR="/path/to/restore/folder"  # Destination directory for restoration

# Check if the restore directory exists
if [ ! -d "$RESTORE_DIR" ]; then
  mkdir -p "$RESTORE_DIR"
fi

# Restore the backup
tar -xzf "$BACKUP_FILE" -C "$RESTORE_DIR"

# Check if the restoration was successful
if [ $? -eq 0 ]; then
  echo "Backup was successfully restored to: $RESTORE_DIR"
else
  echo "Error while restoring the backup."
fi
