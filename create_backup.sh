#!/bin/bash

# Backup configuration
BACKUP_DIR="/path/to/backup/folder"  # Destination directory for backups
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# List of files and directories to back up
FILES_TO_BACKUP=(
    "/path/to/file1"
    "/path/to/directory1"
    "/path/to/file2"
    "/path/to/directory2"
)

# Check if the backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Create the backup
tar -czf "$BACKUP_FILE" "${FILES_TO_BACKUP[@]}"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup was successfully created: $BACKUP_FILE"
else
  echo "Error while creating the backup."
fi
