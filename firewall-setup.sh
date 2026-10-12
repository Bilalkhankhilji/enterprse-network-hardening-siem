#!/bin/bash

# UFW Firewall Setup Script for Ubuntu Server Hardening
echo "Starting UFW Firewall Configuration..."

# Ensure UFW is installed
sudo apt update && sudo apt install ufw -y

# Set default policies (Deny incoming, Allow outgoing)
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH (modify port if using a custom port)
sudo ufw allow 22/tcp

# Allow HTTP and HTTPS web traffic if hosting services
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Enable UFW firewall
sudo ufw --force enable

echo "Firewall rules applied successfully!"
sudo ufw status verbose