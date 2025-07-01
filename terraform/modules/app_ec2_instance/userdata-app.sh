#!/bin/bash
# User-data script for App Tier (PHP API)

# Update packages and install PHP, required extensions, and git
yum update -y
yum install -y php php-mysqlnd php-pdo php-mbstring php-json php-cli git

# Start and enable Apache service
yum install -y httpd mariadb
systemctl start httpd
systemctl enable httpd

# Clone the application repo (replace <GIT_REPO_URL> with actual URL)
git clone https://github.com/jsabrokwah/terraform-lampstack.git /tmp/app-repo

# Deploy API PHP files
mkdir -p /var/www/api
cp -r /tmp/app-repo/src/api/* /var/www/api/


# Replace DB credentials in config/Database.php with Terraform output variables
if [ -n "$DB_HOST" ] && [ -n "$DB_ROOT_PASSWORD" ]; then
  sed -i "s/DB_HOST_PLACEHOLDER/$DB_HOST/g" /var/www/api/config/Database.php
  sed -i "s/DB_USER_PLACEHOLDER/root/g" /var/www/api/config/Database.php
  sed -i "s/DB_PASS_PLACEHOLDER/$DB_ROOT_PASSWORD/g" /var/www/api/config/Database.php
  sed -i "s/DB_NAME_PLACEHOLDER/todos/g" /var/www/api/config/Database.php
fi

# Set permissions
chown -R apache:apache /var/www/api
chmod -R 755 /var/www/api
