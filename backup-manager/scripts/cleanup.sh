#!/bin/bash

CONFIG_FILE="$(dirname "$0")/../config/backup.conf"
source "$CONFIG_FILE"
source "$(dirname "$0")/logger.sh"

log_message "Cleanup started" "$LOG_FILE"

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {} \;

if [ $? -eq 0 ]; then
    log_message "Old backups deleted (>$RETENTION_DAYS days)" "$LOG_FILE"
else
    log_message "ERROR: Cleanup failed" "$LOG_FILE"
fi

log_message "Cleanup completed" "$LOG_FILE"
