#  Website Uptime Checker 

A production-style Bash script that monitors website availability, logs uptime status with timestamps, and supports large-scale input lists (100+ websites).

---

##  Project Description

The **Website Uptime Checker** is a lightweight monitoring tool built using shell scripting. It continuously checks whether configured websites are **UP or DOWN** using HTTP status codes.

This project demonstrates key **DevOps concepts** like automation, monitoring, logging, and reliability engineering.

---

##  Features

*  Monitor 100+ websites from a config file
*  HTTP status check using `curl`
*  Timestamp-based logging
*  Timeout & failure handling
*  Clean modular structure
*  Cron-job ready automation
*  Lightweight & fast execution

---

##  Project Structure

```
website-uptime-checker/
├── config/
│   └── sites.txt          # Input: list of websites (100+ URLs)
├── logs/
│   └── uptime.log         # Output logs
├── uptime_checker.sh      # Main script
├── .gitignore
└── README.md
```

---
##  Architecture Diagram (Enhanced)

```
                        ┌───────────────────────────┐
                        │     config/sites.txt      │
                        │   (List of 100+ URLs)     │
                        └────────────┬──────────────┘
                                     │
                                     ▼
                        ┌───────────────────────────┐
                        │   uptime_checker.sh       │
                        │---------------------------│
                        │ • Read URLs               │
                        │ • Loop through each site  │
                        │ • Send HTTP request       │
                        │ • Capture status code     │
                        └────────────┬──────────────┘
                                     │
                 ┌───────────────────┴───────────────────┐
                 │                                       │
                 ▼                                       ▼
     ┌───────────────────────────┐         ┌───────────────────────────┐
     │     HTTP Response 200     │         │   Error / Timeout / !200  │
     │---------------------------│         │---------------------------│
     │ ✔ Website is UP           │        │ ✖ Website is DOWN         │
     └────────────┬──────────────┘         └────────────┬──────────────┘
                  │                                     │
                  └──────────────┬──────────────────────┘
                                 ▼
                    ┌───────────────────────────┐
                    │       logs/uptime.log     │
                    │---------------------------│
                    │ Timestamped Results       │
                    │ Status (UP / DOWN)        │
                    └────────────┬──────────────┘
                                 │
                                 ▼
                    ┌───────────────────────────┐
                    │      Cron Scheduler       │
                    │---------------------------│
                    │ Runs script periodically  │
                    │ (e.g., every 5 minutes)   │
                    └───────────────────────────┘
```

##  Working Principle

1. Reads URLs from `config/sites.txt`
2. Iterates through each site
3. Sends HTTP request using `curl`
4. Extracts HTTP status code
5. Logs result with timestamp
6. Handles timeouts and failures

---

### Input File (100+ Websites)


---

##  Installation & Setup

###  Clone Repository

```bash
https://github.com/harshitcse70/devops-shell-projects.git
cd website-uptime-checker
```

---

###  Make Script Executable

```bash
chmod +x uptime_checker.sh
```

---

###  Run Script

```bash
./uptime_checker.sh
```

---

##  Sample Output

```
 Starting Website Uptime Check...
 Uptime check completed. Logs saved to logs/uptime.log
```

---

## 📄 Log Example

```
[2026-04-10 14:10:01] https://google.com is UP (200)
[2026-04-10 14:10:02] https://github.com is UP (200)
[2026-04-10 14:10:03] https://example.com is DOWN (404)
```

---

##  Cron Automation

```bash
crontab -e
```

Run every 5 minutes:

```
*/5 * * * * /full/path/uptime_checker.sh
```

---



