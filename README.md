# Bash Script for Backing Up Multiple Files or Directories
Below you will find a Bash script that allows you to create and restore backups of specified files or directories. The script uses tools such as *tar* for compression and *rsync* for restoration.

## Script to create a backup:

```bash
#!/bin/bash

# Settings
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Function to create a backup
create_backup() {
    mkdir -p "$BACKUP_DIR"
    tar -czf "$BACKUP_FILE" "$@"
    echo "Backup created: $BACKUP_FILE"
}

# Function to restore a backup
restore_backup() {
    if [[ -f $1 ]]; then
        tar -xzf "$1" -C "$2"
        echo "Backup restored from: $1 to directory: $2"
    else
        echo "Backup file does not exist: $1"
    fi
}

# Checking arguments
if [[ $1 == "backup" ]]; then
    shift
    if [[ $# -eq 0 ]]; then
        echo "Please provide at least one file or directory to back up."
        exit 1
    fi
    create_backup "$@"
elif [[ $1 == "restore" ]]; then
    shift
    if [[ $# -ne 2 ]]; then
        echo "Usage: $0 restore [path_to_backup.tar.gz] [path_to_restore_directory]"
        exit 1
    fi
    restore_backup "$@"
else
    echo "Usage: $0 {backup|restore} [file1] [file2] [...]"
    echo "Example: $0 backup /path/to/file1 /path/to/directory2 /path/to/file3"
    echo "Example: $0 restore /path/to/backup.tar.gz /path/to/restore_directory"
fi
```

## Script to restore a backup:

```bash
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
```
## Explanation:
