#!/bin/bash

# Update the system
apt update
apt upgrade -y

# Install necessary packages
apt install -y apache2 apache2-utils libapache2-mod-php7.4 php7.4 php7.4-common php7.4-gd php7.4-mysql php7.4-imap php74-cli php7.4-cgi libapache2-mod-fcgid apache2-suexec-pristine php-pear php-auth php7.4-mcrypt mcrypt imagemagick libruby libapache2-mod-python php7.4-curl php7.4-intl php7.4-pspell php7.4-recode php7.4-sqlite3 php7.4-tidy php7.4-xmlrpc php7.4-xsl memcached php-memcache php-imagick php-gettext php7.4-zip php7.4-mbstring php7.4-soap php7.4-fpm php7.4-opcache php-apcu php-apcu-bc php7.4-bcmath php7.4-json php7.4-ldap php7.4-dev php7.4-xml libmcrypt-dev libssl-dev libcurl4-openssl pkg-config libmagickwand-dev libxslt1-dev libzip-dev libonig-dev libfreetype6-dev libjpeg-dev libpng-dev libwebp-dev libxpm-dev libgd-dev libxml2-dev libicu-dev libpspell-dev librecode-dev libtidy-dev libsqlite3-dev libxslt-dev libyaml-dev libmemcached-dev libapache2-mod-passenger

# Install MySQL and set root password
apt install -y mysql-server
mysql_secure_installation

# Install PureFTPd
apt install -y pure-ftpd pure-ftpd-common pure-ftpd-mysql

# Install BIND DNS Server
apt install -y bind9 dnsutils

# Install Postfix Mail Server
apt install -y postfix postfix-mysql postfix-doc mariadb-client mariadb-server openssl getmail4 rkhunter binutils dovecot-imapd dovecot-pop3d dovecot-mysql dovecot-sieve dovecot-lmtpd sudo

# Install Dovecot IMAPPOP3 Server
apt install -y dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-mysql dovecot-sieve dovecot-managesieved

# Install ISPConfig 3
cd /tmp
 -O ispconfig.tar.gz https://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
tar xfz ispconfig.tar.gz
cd ispconfig3_install/install/
php -q install.php

# Restart services
systemctl restart apache2
systemctl restart pure-ftpd-mysql
systemctl restart bind9
systemctl restart postfix
systemctl restart dovecot

# Enable services on boot
systemctl enable apache2
systemctl enable pure-ftpd-mysql
systemctl enable bind9
systemctl enable postfix
systemctl enable dovecot

# Configure firewall
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 20/tcp
ufw allow 21/tcp
ufw allow 53/tcp
ufw allow 53/udp
ufw allow 25/tcp
ufw allow 587/tcp
ufw allow 110/tcp
ufw allow 143/tcp
ufw allow 993/tcp
ufw allow 995/tcp
ufw allow 3306/tcpufw allow 8080/tcp
ufw allow 10000/tcp
ufw enable

# Done
echo "Perfect Server setup complete!"

