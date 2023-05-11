#!/bin/bash

# Install Apache
yum install httpd -y

# Start Apache service
systemctl start httpd.service

# Configure Apache to start on boot
systemctl enable httpd.service

# Install MySQL
yum install mariadb-server mariadb -y

# Start MySQL service
systemctl start mariadb

# Configure MySQL to start on boot
systemctl enable mariadb

# Run MySQL secure installation (set root password and other defaults)
mysql_secure_installation <<EOF

y
password
password
y
n
y
y
EOF

# Install PHP
yum install php php-mysql -y

# Restart Apache service
systemctl restart httpd.service

# Install FTP
yum install vsftpd -y

# Start FTP service
systemctl start vsftpd.service

# Configure FTP to start on boot
systemctl enable vsftpd.service

# Add a new user account for web development with home directory as /var/www/html
useradd -G apache -d /var/www/html -s /sbin/nologin developer

# Set password for the user
echo "developer:password" | chpasswd

# Install phpMyAdmin
yum install epel-release -y
yum install phpmyadmin -y

# Create symbolic link for phpMyAdmin
ln -s /usr/share/phpMyAdmin/ /var/www/html/

# Change ownership of /var/www/html to the new user
chown -R developer:apache /var/www/html/

# Set permissions for /var/www/html
chmod -R 775 /var/www/html/

# Add PATH to .bash_profile
echo 'export PATH=$PATH:/usr/local/bin' >> /home/developer/.bash_profile

# Restart Apache service
systemctl restart httpd.service
