#!/bin/bash
# User-data script for Web Tier (Apache + PHP + Frontend)

# Update packages and install Apache, PHP, and git
yum update -y
yum install -y httpd php git

# Start and enable Apache service
systemctl start httpd
systemctl enable httpd

# Clone the application repo (replace <GIT_REPO_URL> with actual URL)
git clone <GIT_REPO_URL> /tmp/app-repo

# Deploy frontend files
mkdir -p /var/www/html
cp -r /tmp/app-repo/src/frontend/* /var/www/html/

# Replace API base URL placeholder in frontend JS with actual API URL from Terraform output
# The API_URL variable should be passed to this script via Terraform user_data variables
if [ -n "$APP_INSTANCE_PRIVATE_IP" ]; then
  API_URL="http://$APP_INSTANCE_PRIVATE_IP/api"
  sed -i "s|API_BASE_URL_PLACEHOLDER|$API_URL|g" /var/www/html/js/scripts.js
fi

# Set permissions
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
