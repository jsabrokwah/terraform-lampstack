#!/bin/bash
# User-data script for DB Tier (MySQL server and database setup)

# Update packages and install MySQL server
yum update -y
yum install -y mariadb-server

# Start and enable MySQL service
systemctl start mariadb
systemctl enable mariadb


# Secure MySQL installation (basic)
if [ -n "$DB_ROOT_PASSWORD" ]; then
  mysql -e "UPDATE mysql.user SET Password = PASSWORD('$DB_ROOT_PASSWORD') WHERE User = 'root';"
  mysql -e "DELETE FROM mysql.user WHERE User='';"
  mysql -e "DROP DATABASE IF EXISTS test;"
  mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
  mysql -e "FLUSH PRIVILEGES;"

  # Create todos database and todos table
  mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS todos;"
  mysql -uroot -p"$DB_ROOT_PASSWORD" -e "USE todos; CREATE TABLE IF NOT EXISTS todos (id INT AUTO_INCREMENT PRIMARY KEY, task VARCHAR(255) NOT NULL);"
fi

