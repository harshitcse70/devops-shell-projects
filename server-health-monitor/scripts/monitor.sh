#!/bin/bash

# Load logger
source ./logger.sh

# ===== FUNCTIONS =====

get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    echo ${cpu_usage%.*}
}

get_memory_usage() {
    mem_usage=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100}')
    echo ${mem_usage%.*}
}

get_disk_usage() {
    disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo $disk_usage
}

# ===== CONFIG =====
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90

check_thresholds() {
    cpu=$(get_cpu_usage)
    mem=$(get_memory_usage)
    disk=$(get_disk_usage)

    log_info "CPU: $cpu%, Memory: $mem%, Disk: $disk%"

    if [ "$cpu" -gt "$CPU_THRESHOLD" ]; then
        log_alert "High CPU usage: $cpu%"
        ./alert.sh "CPU usage is high: $cpu%"
    fi

    if [ "$mem" -gt "$MEM_THRESHOLD" ]; then
        log_alert "High Memory usage: $mem%"
        ./alert.sh "Memory usage is high: $mem%"
    fi

    if [ "$disk" -gt "$DISK_THRESHOLD" ]; then
        log_alert "High Disk usage: $disk%"
        ./alert.sh "Disk usage is high: $disk%"
    fi
}



main() {
    log_info "Monitoring started"
    check_thresholds
    log_info "Monitoring completed"
}

main
