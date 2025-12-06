#!/bin/bash
set -e  # exit on error

apt update -y && apt upgrade -y

# Install Docker and Docker Compose
apt install -y docker.io curl
systemctl enable --now docker
curl -L "https://github.com/docker/compose/releases/download/2.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Prepare uptime-kuma directory and set permissions
mkdir -p /opt/uptime-kuma
chown -R ubuntu:www-data /opt/uptime-kuma
chmod -R 775 /opt/uptime-kuma

# Add ubuntu user to docker group
usermod -aG docker ubuntu

echo "Frontend machine bootstrapped successfully"
