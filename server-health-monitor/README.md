# Server Health Monitoring & Alert System

## Overview

The **Server Health Monitoring & Alert System** is a Bash-based DevOps project designed to monitor critical system metrics such as **CPU usage, memory utilization, and disk space**.

It provides:

* Real-time monitoring 
* Centralized logging 
* Threshold-based alerting 
* Automation using cron 

This project follows **modular scripting principles**, making it scalable, reusable, and production-ready.

---

##  Key Features

*  Monitor CPU, Memory, and Disk usage
*  Threshold-based alert system
*  Modular scripting (separation of concerns)
*  Logging with timestamps and log levels
*  Email alerts using `mail` command
*  Automated execution using cron jobs
*  Clean and scalable project structure

---

##  Project Structure

```
server-health-monitor/
│
├── config/
│   └── monitor.conf        # (Optional future enhancement)
│
├── logs/
│   └── monitor.log         # Stores system logs
│
└── scripts/
    ├── monitor.sh          # Main orchestrator script
    ├── alert.sh            # Handles alert notifications
    └── logger.sh           # Logging utility module
```

---

##  Architecture 

```
                +----------------------+
                |      CRON JOB        |
                |  (Runs every 5 min)  |
                +----------+-----------+
                           |
                           v
                +----------------------+
                |     monitor.sh       |
                |  (Main Controller)   |
                +----------+-----------+
                           |
        +------------------+------------------+
        |                  |                  |
        v                  v                  v
+---------------+  +---------------+  +---------------+
|  CPU Check    |  | Memory Check  |  | Disk Check    |
+---------------+  +---------------+  +---------------+
        |                  |                  |
        +------------------+------------------+
                           |
                           v
                +----------------------+
                |  Threshold Checker   |
                +----------+-----------+
                           |
        +------------------+------------------+
        |                                     |
        v                                     v
+----------------------+          +----------------------+
|   logger.sh          |          |     alert.sh         |
| (Logs all activity)  |          | (Email/Terminal Alert)|
+----------------------+          +----------------------+
                           |
                           v
                +----------------------+
                |   monitor.log file   |
                +----------------------+
```

---

##  How It Works

1. Cron triggers `monitor.sh` at scheduled intervals
2. `monitor.sh` collects:

   * CPU usage
   * Memory usage
   * Disk usage
3. Values are compared against predefined thresholds
4. All metrics are logged using `logger.sh`
5. If thresholds are exceeded:

   * `alert.sh` is triggered
   * Alert is printed and emailed

---

## Metrics Collection

| Metric | Command Used |
| ------ | ------------ |
| CPU    | `top`        |
| Memory | `free`       |
| Disk   | `df`         |

---

##  Threshold Configuration

Defined inside `monitor.sh`:

```
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
```

---

## Logging System

Logs are stored in:

```
logs/monitor.log
```

### Example Log Entry

```
2026-04-10 12:00:01 [INFO] CPU: 45%, Memory: 60%, Disk: 70%
2026-04-10 12:00:01 [ALERT] High CPU usage: 85%
```

### Log Levels

* `[INFO]` → Normal operations
* `[ERROR]` → Failures
* `[ALERT]` → Threshold exceeded

---
## Alert System

Alerts are handled by `alert.sh`:

* Prints alert message to terminal
* Sends email using `mail` command

### Example

```
ALERT: CPU usage is high: 85%
```

---

## Cron Automation

### Setup Cron Job

```
crontab -e
```

### Add:

```
*/5 * * * * /path/to/server-health-monitor/scripts/monitor.sh >> /path/to/server-health-monitor/logs/cron.log 2>&1
```

### Explanation

* `*/5 * * * *` → Runs every 5 minutes
* `>> cron.log` → Appends output
* `2>&1` → Captures errors

---

##  Setup Instructions

### 1. Clone Repository

```
[git clone <your-repo-url>](https://github.com/harshitcse70/devops-shell-projects.git)
cd devops-shell-projects/server-health-monitor
```

---

### 2. Give Permissions

```
chmod +x scripts/*.sh
```

---

### 3. Install Mail Utility

```
sudo apt update
sudo apt install mailutils -y
```

---

### 4. Run Script Manually

```
cd scripts
./monitor.sh
```

---

## Testing Alerts

To test alert system:

```
CPU_THRESHOLD=1
```

Run script → alert should trigger immediately.

---

##  Design Principles Used

* Modular scripting
* Separation of concerns
* Reusability
* Observability (logging)
* Automation (cron)

---



