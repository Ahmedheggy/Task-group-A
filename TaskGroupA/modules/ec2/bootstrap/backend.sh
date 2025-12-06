#!/bin/bash
set -e  # exit on error

apt update -y && apt upgrade -y

# Install runtime dependencies required for Laravel backend
apt install -y git php php-cli php-fpm php-mbstring php-xml php-zip php-mysql php-curl php-bcmath unzip curl

# Install Composer (global PHP package manager)
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

mkdir -p /var/www/backend
chown -R ubuntu:www-data /var/www/backend
chmod -R 775 /var/www/backend

# Enable service & redirect output to null
systemctl enable php*-fpm >/dev/null 2>&1

echo "Backend machine bootstrapped successfully"
