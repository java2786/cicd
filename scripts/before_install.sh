#!/bin/bash
set -e

echo "Starting before_install script..."

# Install Node.js 18 if not present
if ! command -v node &> /dev/null; then
    curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
    yum install -y nodejs
fi

# Install PM2 if not present
if ! command -v pm2 &> /dev/null; then
    npm install -g pm2
fi

# Clean app directory to avoid root-owned leftovers
rm -rf /home/ec2-user/app
mkdir -p /home/ec2-user/app

# Correct ownership
chown -R ec2-user:ec2-user /home/ec2-user/app
# chmod -R 755 /home/ec2-user/app

echo "before_install completed"
