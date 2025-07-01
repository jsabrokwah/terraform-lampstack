#!/bin/bash
# User-data script for Web Tier (Apache + PHP + Frontend)

# Update packages and install Apache, PHP, and git
yum update -y
yum install -y httpd php git

# Start and enable Apache service
systemctl start httpd
systemctl enable httpd

# Clone the application repo (replace <GIT_REPO_URL> with actual URL)
git clone https://github.com/jsabrokwah/terraform-lampstack.git /tmp/app-repo

# Deploy frontend files
mkdir -p /var/www/html
cp -r /tmp/app-repo/src/frontend/* /var/www/html/

# Replace API base URL placeholder in frontend JS with proxy URL
sed -i "s|API_BASE_URL_PLACEHOLDER|/api/proxy.php|g" /var/www/html/js/scripts.js

# Deploy PHP proxy script
mkdir -p /var/www/html/api
cp /tmp/app-repo/frontend/proxy/proxy.php /var/www/html/api/proxy.php

# Optionally, set permissions for the proxy script
chown apache:apache /var/www/html/api/proxy.php
chmod 644 /var/www/html/api/proxy.php

# Set permissions
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
