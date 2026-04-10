#!/bin/bash

CONFIG_FILE="$(dirname "$0")/../config/backup.conf"
source "$CONFIG_FILE"
source "$(dirname "$0")/logger.sh"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

log_message "Backup started" "$LOG_FILE"

if tar -czf "$BACKUP_FILE" $SOURCE_DIRS 2>/dev/null; then
    log_message "Backup successful: $BACKUP_FILE" "$LOG_FILE"
else
    log_message "ERROR: Backup failed" "$LOG_FILE"
    exit 1
fi

log_message "Backup completed" "$LOG_FILE"
