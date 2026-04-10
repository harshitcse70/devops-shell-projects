#!/bin/bash

LOG_FILE="../logs/monitor.log"

log_info() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1" >> $LOG_FILE
}

log_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1" >> $LOG_FILE
}

log_alert() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ALERT] $1" >> $LOG_FILE
}
