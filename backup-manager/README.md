#  Automated Backup & Cleanup Manager

##  Project Overview

This project is a **modular shell scripting solution** designed to automate system backups, manage storage efficiently, and ensure reliability through logging and validation.

It follows **DevOps best practices** such as:

* Configuration-driven design
* Script modularization
* Centralized logging
* Cron-based scheduling

---

##  Key Features

*  **Automated Backups**

  * Compresses directories into `.tar.gz`
  * Uses timestamp-based naming to avoid overwrites

*  **Automatic Cleanup**

  * Deletes backups older than a defined retention period

*  **Centralized Logging**

  * Logs all operations with timestamps for debugging and monitoring

* **Error Handling & Validation**

  * Validates configuration and directories before execution
  * Stops execution on failure

*  **Cron Job Scheduling**

  * Fully automated execution at scheduled intervals

*  **Modular Architecture**

  * Each functionality is separated into individual scripts

---
##  Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      BACKUP SYSTEM                          │
│                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │   Cron Job   │──│  run_all.sh  │──│  logger.sh   │       │
│  │   Scheduler  │  │(Orchestrator)│  │   (Logging)  │       │
│  └──────────────┘  └──────┬───────┘  └──────────────┘       │
│                           │                                 │
│         ┌─────────────────┼──────────────────┐              │
│         │                 │                  │              │
│    ┌────▼─────┐     ┌─────▼──────┐    ┌─────▼──────┐        │
│    │validate.sh│    │ backup.sh  │    │ cleanup.sh │        │
│    │(Pre-check)│    │ (Creation) │    │ (Deletion) │        │
│    └────┬─────┘     └─────┬──────┘    └─────┬──────┘        │
│         │                  │                  │             │
│         └──────────────────┼──────────────────┘             │
│                            │                                │
│                ┌───────────▼───────────┐                    │
│                │    backup.conf        │                    │
│                │  (Configuration)      │                    │
│                └───────────────────────┘                    │
└─────────────────────────────────────────────────────────────┘

Data Flow:
1. Cron triggers run_all.sh
2. Orchestrator loads config, validates environment
3. Creates compressed backup with timestamp
4. Cleans up old backups based on retention policy
5. Logs all operations to centralized log file
```

##  Project Structure

```
backup-manager/
├── scripts/
│   ├── backup.sh       # Handles backup creation
│   ├── cleanup.sh      # Deletes old backups
│   ├── validate.sh     # Validates configuration
│   ├── logger.sh       # Central logging utility
│   └── run_all.sh      # Master script (orchestrator)
├── config/
│   └── backup.conf     # Configuration file
├── logs/
│   └── .gitkeep        # Keeps folder in Git
├── backups/
│   └── .gitkeep        # Keeps folder in Git
└── README.md           #This file
```

---

## Configuration

Edit the configuration file:

```
config/backup.conf
```

Example:

```
SOURCE_DIRS="/home/ubuntu/test_backup_folder"
BACKUP_DIR="/home/ubuntu/devops-shell-projects/backup-manager/backups"
RETENTION_DAYS=7
LOG_FILE="/home/ubuntu/devops-shell-projects/backup-manager/logs/backup.log"
```

---

##  How to Run

### Manual Execution

```
cd scripts
./run_all.sh
```

---

##  Cron Job Setup

Open crontab:

```
crontab -e
```

Add:

```
0 2 * * * /home/ubuntu/devops-shell-projects/backup-manager/scripts/run_all.sh >> /home/ubuntu/devops-shell-projects/backup-manager/logs/cron.log 2>&1
```

---

##  Sample Output

```
========== BACKUP SYSTEM START ==========
Validation successful
2026-04-10 12:00:00 : Backup started
2026-04-10 12:00:02 : Backup successful
2026-04-10 12:00:02 : Cleanup started
2026-04-10 12:00:03 : Cleanup completed
========== BACKUP SYSTEM END ==========
```

---

##  Concepts Demonstrated

* Shell Scripting Automation
* Cron Scheduling
* File Compression (`tar`, `gzip`)
* Log Management
* Error Handling
* Modular Script Design

---
