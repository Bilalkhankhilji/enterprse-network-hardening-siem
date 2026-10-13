# Enterprise Network Hardening & SIEM Log Analysis 🛡️

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/Platform-Ubuntu%20%7C%20Debian%20%7C%20RHEL-orange.svg)]()
[![Security Level: Hardened](https://img.shields.io/badge/Security-Hardened%20Node-green.svg)]()

An enterprise-ready Linux server hardening playbook and automated security event parsing framework. This repository provides automated deployment scripts for firewall rules, intrusion prevention rulesets, and structured log parsing procedures for SIEM environments.

---

## 📋 Overview & Features

- 🔒 **Automated Firewall Provisioning:** Pre-configured Uncomplicated Firewall (UFW) rules enforcing strict ingress/egress policies and default-deny stances.
- 🚫 **Intrusion Defense:** Fail2ban jail configurations targeting SSH brute-force attacks, HTTP rate-limiting, and port probes.
- 📊 **SIEM Log Parsing:** Bash and Python scripts to extract, structure, and sanitize authentication logs (`/var/log/auth.log` / `journalctl`) for ingestion into SIEM tools.
- ⚡ **SSH Security Baseline:** Automated SSH daemon configuration enforcement (root login disabled, key-based authentication enforced, non-standard port binding).

---

## 🚀 Quick Start & Installation

### Prerequisites
- Operating System: Ubuntu Server 20.04/22.04 LTS or RHEL 8/9
- Privileges: `sudo` / Root access

### Deployment Steps
```bash
# 1. Clone the repository
git clone [https://github.com/Bilalkhankhilji/enterprse-network-hardening-siem.git](https://github.com/Bilalkhankhilji/enterprse-network-hardening-siem.git)
cd enterprse-network-hardening-siem

# 2. Make hardening script executable
chmod +x harden_server.sh log_parser.sh

# 3. Run the automated baseline hardening script
sudo ./harden_server.sh
