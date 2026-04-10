#!/bin/bash

source "$(dirname "$0")/../config/backup.conf"

if [ -z "$SOURCE_DIRS" ] || [ -z "$BACKUP_DIR" ] || [ -z "$LOG_FILE" ]; then
    echo "ERROR: Missing configuration values"
    exit 1
fi

# Check source exists
for dir in $SOURCE_DIRS; do
    if [ ! -d "$dir" ]; then
        echo "ERROR: Source directory $dir does not exist"
        exit 1
    fi
done

echo "Validation successful"
