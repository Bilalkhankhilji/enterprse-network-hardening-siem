# Enterprise Network Hardening & SIEM Log Monitoring Lab

## Overview
This repository documents a simulated enterprise network security lab environment created to practice server hardening, firewall implementation, and threat detection using Ubuntu Server and log analysis tools.

## Architecture & Environment
* **Host/Management:** VirtualBox / VMware virtual machine environments.
* **OS:** Ubuntu Server (Latest LTS).
* **Security Controls:** UFW (Uncomplicated Firewall), Fail2ban, SSH Key-Based Authentication, and System Log Auditing.

---

## Step-by-Step Lab Implementation

### 1. Initial Server Hardening
* Disabled root login over SSH to prevent direct administrative brute-force attempts.
* Enforced SSH key-based authentication and disabled password authentication.
* Configured non-standard ports where applicable.

### 2. UFW Firewall Configuration
Implemented strict default ingress/egress filtering rules using `firewall-setup.sh`:
* Denied all incoming traffic by default.
* Allowed only necessary service ports (e.g., SSH on custom port, HTTP/HTTPS).

### 3. Fail2Ban Brute-Force Mitigation
* Installed and configured `fail2ban` to monitor `/var/log/auth.log`.
* Configured jail rules to automatically ban IP addresses exhibiting multiple failed login attempts within a specific time window.

---

## Artifacts Included in this Repo
* `firewall-setup.sh`: Automated Bash script for configuring UFW rules.
* `fail2ban-config.local`: Sanitized configuration file for SSH monitoring.
* `log-analysis.md`: Sample logs showing brute-force detection and IP blocking analysis.