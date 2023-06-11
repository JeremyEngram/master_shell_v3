#!/bin/bash
# Install MariaDB
sudo apt update sudo apt install 
mariadb-server
# Start MariaDB service
sudo systemctl start mariadb sudo 
systemctl enable mariadb
# Secure the MariaDB installation
sudo mysql_secure_installation
# Configure MariaDB for remote 
# access
sudo sed -i 
's/127.0.0.1/0.0.0.0/g' 
/etc/mysql/mariadb.conf.d/50-server.cnf 
sudo systemctl restart mariadb
# Connect to MariaDB as root
sudo mysql -u root -p
# Create users and grant 
# privileges
CREATE USER 'root'@'%' IDENTIFIED 
BY 'hacker'; GRANT ALL PRIVILEGES 
ON *.* TO 'root'@'%' WITH GRANT 
OPTION; CREATE USER 'research'@'%' 
IDENTIFIED BY 'hacker'; GRANT ALL 
PRIVILEGES ON *.* TO 
'research'@'%' WITH GRANT OPTION; 
CREATE USER 'jeremy'@'%' 
IDENTIFIED BY 'hacker'; GRANT ALL 
PRIVILEGES ON *.* TO 'jeremy'@'%' 
WITH GRANT OPTION; CREATE USER 
'siebel'@'%' IDENTIFIED BY 
'hacker'; GRANT ALL PRIVILEGES ON 
*.* TO 'siebel'@'%' WITH GRANT 
OPTION; FLUSH PRIVILEGES;
# Exit MariaDB
exit
