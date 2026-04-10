#  DevOps Shell Projects

A structured collection of **real-world automation projects** built using Bash scripting.
This repository demonstrates how core DevOps practices like **automation, monitoring, logging, and scheduling** can be implemented using lightweight shell scripts in a production-like environment.

---

##  Overview

This repository is designed to simulate **practical DevOps workflows**, focusing on:

* Automation of operational tasks
* System monitoring & alerting
* Backup and recovery strategies
* Service uptime tracking
* Centralized logging across projects

Each project is **modular, configurable, and cron-ready**, following a consistent structure used in real systems.

---



##  Repository Structure

```bash
devops-shell-projects/
│
├── backup-manager
│   ├── README.md
│   ├── backups
│   │   ├── backup_2026-04-10_07-10-21.tar.gz
│   │   └── backup_2026-04-10_07-12-01.tar.gz
│   ├── config
│   │   └── backup.conf
│   ├── logs
│   │   ├── backup.log
│   │   └── cron.log
│   └── scripts
│       ├── backup.sh
│       ├── cleanup.sh
│       ├── logger.sh
│       ├── run_all.sh
│       └── validate.sh
│
├── server-health-monitor
│   ├── README.md
│   ├── config
│   │   └── monitor.conf
│   ├── logs
│   │   ├── cron.log
│   │   └── monitor.log
│   └── scripts
│       ├── alert.sh
│       ├── logger.sh
│       └── monitor.sh
│
└── website-uptime-checker
    ├── README.md
    ├── config
    │   ├── sites.txt
    │   └── sites2.txt
    ├── logs
    │   └── uptime.log
    └── uptime_checker.sh
```
##  Overall Architecture

```bash
                         +----------------------+
                         |      CRON JOBS       |
                         |  (Scheduled Tasks)   |
                         +----------+-----------+
                                    |
        ---------------------------------------------------------
        |                        |                             |
        v                        v                             v

+-------------------+   +------------------------+   +--------------------------+
|  Backup Manager   |   | Server Health Monitor  |   | Website Uptime Checker   |
+-------------------+   +------------------------+   +--------------------------+
| backup.sh         |   | monitor.sh             |   | uptime_checker.sh        |
| cleanup.sh        |   | alert.sh               |   |                          |
| validate.sh       |   |                        |   |                          |
+---------+---------+   +-----------+------------+   +------------+-------------+
          |                         |                             |
          v                         v                             v

+-------------------+   +------------------------+   +--------------------------+
|   backups/        |   |     logs/              |   |        logs/             |
| (.tar.gz files)   |   | monitor.log            |   | uptime.log               |
+-------------------+   | cron.log               |   +--------------------------+
                        +------------------------+

          \____________________   _______________________/
                               \ /
                                v

                        +------------------+
                        |  Central Logs    |
                        | (Per Project)    |
                        +------------------+
```

---

##  Project Breakdown

###  1. Backup Manager

Handles automated backups with validation, logging, and cleanup.

**Highlights:**

* Creates compressed backups (`.tar.gz`)
* Config-driven directory selection
* Automatic cleanup of old backups
* Central logging system

 [More details](backup-manager/README.md)

---

### 2. Server Health Monitor

Tracks system performance and triggers alerts when thresholds are exceeded.

**Monitors:**

* CPU usage
* Memory usage
* Disk utilization

**Features:**

* Configurable thresholds
* Alert script integration
* Cron-based execution

 [More details](server-health-monitor/README.md)

---

### 3. Website Uptime Checker

Monitors availability of websites and logs uptime/downtime events.

**Features:**

* Multi-site monitoring via config files
* HTTP status checking
* Continuous logging of uptime history

 [More details](website-uptime-checker/README.md)

---

##  Standard Project Design Pattern

All projects follow a **consistent and scalable structure**:

* `config/` → External configuration (decouples logic from values)
* `scripts/` → Core automation logic
* `logs/` → Execution and cron logs
* `README.md` → Project-specific documentation

This mirrors real-world DevOps practices where **scripts are reusable and configurable**.

---

##  Getting Started

```bash
https://github.com/harshitcse70/devops-shell-projects.git
cd devops-shell-projects
```

Then navigate into any project:

```bash
cd backup-manager
```

Follow the instructions inside that project’s README.

---

##  Tech Stack

* Bash (Shell Scripting)
* Linux utilities (`cron`, `tar`, `df`, `free`, `curl`)
* Logging & file management
* Configuration-driven execution

---
