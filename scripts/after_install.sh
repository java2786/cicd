#!/bin/bash
set -e

echo "Fixing ownership after CodeDeploy copied files..."

chown -R ec2-user:ec2-user /home/ec2-user/app
chmod -R 755 /home/ec2-user/app

echo "Ownership fixed successfully"

