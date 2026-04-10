#!/bin/bash

SITES_FILE="config/sites.txt"
LOG_FILE="logs/uptime.log"
# Terminal message
echo " Starting Website Uptime Check..."

# Create log file if not exists
touch "$LOG_FILE"

echo "===== Uptime Check Started at $(date) =====" >> "$LOG_FILE"

while read -r site; do
    if [ -z "$site" ]; then
        continue
    fi

    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    # Curl with timeout
    status_code=$(curl -o /dev/null -s -w "%{http_code}" --max-time 10 "$site")

    if [ "$status_code" -eq 200 ]; then
        echo "[$timestamp] $site is UP (Status: $status_code)" >> "$LOG_FILE"
    else
        echo "[$timestamp] $site is DOWN (Status: $status_code)" >> "$LOG_FILE"
    fi

done < "$SITES_FILE"

echo "===== Check Completed =====" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
