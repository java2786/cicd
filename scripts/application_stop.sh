#!/bin/bash
set -e

echo "Stopping application..."

# Stop PM2 process if running
pm2 stop cicd-node-app 2>/dev/null || echo "App not running"
pm2 delete cicd-node-app 2>/dev/null || echo "App not in PM2 list"

echo "Application stopped"
