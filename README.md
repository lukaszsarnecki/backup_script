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

### 1. Settings:
- BACKUP_DIR: The directory where backups will be stored.
- TIMESTAMP: A timestamp used for naming the backup file.
- BACKUP_FILE: The path to the backup file that will be created based on the timestamp.

### 2. Function create_backup:
- Creates the backup directory if it doesn’t exist.
- Uses the tar command to compress all specified files/directories into a single .tar.gz file.

### 3. Function restore_backup:
- Checks if the specified backup file exists.
- Uses the tar command to extract the contents of the backup file into the specified directory.

### 4. Argument Checking:
- The script accepts two main commands: backup (to create a backup) and restore (to restore a backup).
- When backing up, it requires at least one path.
- When restoring, it requires the path to the backup file and the path to the directory where the content should be restored.

## Usage example of the Script

### 1. Creating a Backup: Users can specify multiple paths to files and directories:

```bash
./backup_script.sh backup /path/to/file1 /path/to/directory2 /path/to/file3
```

### 2. Restoring a Backup: Restore from the backup file to a specified directory:

```bash
./backup_script.sh restore /path/to/backup.tar.gz /path/to/restore_directory
```

## Note
- Ensure you have the necessary read and write permissions in the specified locations.
- Before using the script, make it executable with the following command:

```bash
chmod +x backup_restore_script.sh
```

```bash
./backup_restore_script.sh
```
