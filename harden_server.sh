#!/bin/bash

# ==============================================================================
# Script Name: harden_server.sh
# Description: Automated Linux Server Hardening & Firewall Baseline Script
# Author: Muhammad Bilal | Assistant Network Administrator
# Target OS: Ubuntu / Debian / RHEL
# ==============================================================================

# Ensure script is run with root/sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "[-] Error: This script must be run as root or with sudo privileges."
  echo "[-] Usage: sudo ./harden_server.sh"
  exit 1
fi

echo "[+] ========================================================"
echo "[+] Starting Enterprise Server Hardening & UFW Baseline..."
echo "[+] ========================================================"

# 1. Update package lists
echo "[+] Updating system package repositories..."
apt-get update -y && apt-get upgrade -y

# 2. Install UFW and Fail2ban if not already present
echo "[+] Installing UFW (Uncomplicated Firewall) and Fail2ban..."
apt-get install -y ufw fail2ban

# 3. Configure UFW Default Policies
echo "[+] Configuring default firewall stances (Deny Incoming, Allow Outgoing)..."
ufw --force reset
ufw default deny incoming
ufw default allow outgoing

# 4. Allow necessary ports (Modify SSH port if custom)
echo "[+] Configuring allowed ports (SSH: 22, HTTP: 80, HTTPS: 443)..."
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

# 5. Enable UFW Firewall and Logging
echo "[+] Enabling UFW firewall and setting high logging..."
ufw --force enable
ufw logging on

# 6. Configure and Start Fail2ban
echo "[+] Configuring Fail2ban service..."
systemctl enable fail2ban
systemctl start fail2ban

echo "[+] ========================================================"
echo "[+] Server Hardening & Firewall Configuration Complete!"
echo "[+] Current UFW Status:"
ufw status verbose
echo "[+] ========================================================"