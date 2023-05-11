Script to Install Apache2, MySQL, and PHP on CentOS

This script installs Apache2, MySQL, and PHP on CentOS, and configures FTP, creates a user account with home directory set to /var/www/html, and installs phpMyAdmin.

Prerequisites

Before running this script, make sure you have sudo privileges on your CentOS server. You can check if you have sudo privileges by running the following command:

bash

sudo whoami

If you are prompted to enter your password, you have sudo privileges.

Usage

To run the script, follow these steps:

Download the install_script.sh file to your CentOS server.

Open a terminal window on your CentOS server.

Navigate to the directory where you saved the install_script.sh file.

Run the following command to make the script executable:

bash
sudo chmod +x install_script.sh
Finally, run the following command to execute the script:

bash
sudo ./install_script.sh
The script will install all required packages silently without any user interaction.

What Does the Script Do?
Here is a breakdown of what the script does:

Installs Apache2 using the httpd package.

Starts the Apache2 service and configures it to start on boot.

Installs MySQL using the mariadb-server and mariadb packages.

Starts the MySQL service and configures it to start on boot.

Runs the MySQL secure installation script to set the root password and configure other defaults.

Installs PHP and the PHP MySQL extension using the php and php-mysql packages.

Restarts the Apache2 service after installing PHP.

Installs FTP using the vsftpd package.

Starts the FTP service and configures it to start on boot.

Creates a new user account named developer, with a home directory of /var/www/html and a login shell set to /sbin/nologin.

Sets the password for the developer user to password. Note: You should change the password for the developer user to a strong password if you plan to use this script in production!

Installs phpMyAdmin using the epel-release and phpmyadmin packages.

Creates a symbolic link from /usr/share/phpMyAdmin/ to /var/www/html/ so that phpMyAdmin can be accessed from a web browser.

Changes the ownership of /var/www/html/ to the developer user and the apache group.

Sets the permissions of /var/www/html/ to 775.

Adds /usr/local/bin to the PATH environment variable in the .bash_profile file for the developer user.

Restarts the Apache2 service to apply any configuration changes.

Accessing Apache2 and phpMyAdmin

After running the script, you can access the default Apache2 page by visiting http://localhost in your web browser. If you want to upload files to your server using FTP, connect to your server using an FTP client like FileZilla, using the credentials for the developer user that was created during the installation process.

You can also access phpMyAdmin by visiting http://localhost/phpmyadmin in your web browser.

License

This script is licensed under the MIT license. See the LICENSE file for more details.
