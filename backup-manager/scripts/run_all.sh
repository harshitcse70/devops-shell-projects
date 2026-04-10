#!/bin/bash

BASE_DIR="$(dirname "$0")"

echo "========== BACKUP SYSTEM START =========="

# Step 1: Validate
bash "$BASE_DIR/validate.sh"
if [ $? -ne 0 ]; then
    echo "Validation failed. Exiting."
    exit 1
fi

# Step 2: Backup
bash "$BASE_DIR/backup.sh"
if [ $? -ne 0 ]; then
    echo "Backup failed. Exiting."
    exit 1
fi

# Step 3: Cleanup
bash "$BASE_DIR/cleanup.sh"

echo "========== BACKUP SYSTEM END =========="
