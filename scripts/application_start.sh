#!/bin/bash
set -e

echo "Starting application..."

cd /home/ec2-user/app

echo "Installing dependencies..."
npm install --production

echo "Starting PM2 process..."
pm2 start server.js --name cicd-node-app --time || pm2 restart cicd-node-app

pm2 save

echo "Application started successfully"

sleep 5

if pm2 list | grep -q "cicd-node-app"; then
    echo "Application is running"
else
    echo "Application failed to start"
    exit 1
fi
