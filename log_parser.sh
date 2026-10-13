#!/bin/bash

# ==============================================================================
# Script Name: log_parser.sh
# Description: Automated Auth Log Parser & SIEM Threat Indicator Extractor
# Author: Muhammad Bilal | Assistant Network Administrator
# ==============================================================================

LOG_FILE="/var/log/auth.log"

# Check if auth.log exists (supports systemd journal fallback if needed)
if [ ! -f "$LOG_FILE" ]; then
    echo "[!] Warning: /var/log/auth.log not found. Attempting journalctl export..."
    journalctl _TRANSPORT=syslog -u ssh > /tmp/ssh_auth.log
    LOG_FILE="/tmp/ssh_auth.log"
fi

echo "[+] ========================================================"
echo "[+] Parsing Authentication Logs for Failed SSH Access..."
echo "[+] ========================================================"

# Extract failed password attempts and count occurrences by IP address
grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr > /tmp/failed_ips.txt

if [ -s /tmp/failed_ips.txt ]; then
    echo "Count | Suspect IP Address"
    echo "-----------------------------------"
    cat /tmp/failed_ips.txt
    echo "-----------------------------------"
    echo "[!] Action Recommended: Review listed IPs against firewall rules."
else
    echo "[+] No failed SSH authentication attempts detected in current log."
fi

echo "[+] ========================================================"
echo "[+] Log Parsing Complete."
echo "[+] ========================================================"