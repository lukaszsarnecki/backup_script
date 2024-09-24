# Bash scripts for create and restore backups
Here are the backup creation and restoration scripts in English, designed for Linux. They use *tar* to create compressed backup archives and to restore them.

## Script to create a backup:

```bash
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
```

## Script to restore a backup:

```bash
#!/bin/bash

# Paths
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
```
## Explanation:
