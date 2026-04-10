#!/bin/bash

log_message() {
    local MESSAGE=$1
    local LOG_FILE=$2

    echo "$(date +"%Y-%m-%d %H:%M:%S") : $MESSAGE" | tee -a "$LOG_FILE"
}
