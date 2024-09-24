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

## Script Explanation:

1. Settings:
   - BACKUP_DIR: The directory where backups will be stored.
