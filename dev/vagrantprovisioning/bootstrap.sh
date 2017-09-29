#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password root'

## Update everthing
####################################################
sudo apt update
sudo apt -y upgrade

## Install Apache
####################################################
sudo apt -y install apache2

## Add Apache to Firewall
####################################################
sudo ufw allow 'Apache Full'

## Apache - Vhosts
####################################################
sudo cp /project/dev/vagrantprovisioning/vhosts/* /etc/apache2/sites-available/
sudo a2dissite 000-default
sudo a2ensite project

## Install MYSQL
####################################################
sudo apt -y install mysql-server-5.7

## MYSQL Security fix
####################################################
sudo mysql_secure_installation

## Allow MYSQL connection
####################################################
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by 'root'; FLUSH PRIVILEGES;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' identified by 'root'; FLUSH PRIVILEGES;"
sudo sed -i "s/.*bind-address.*/# bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf


## Install PHP7
####################################################
sudo apt install -y php7.0 \
    libapache2-mod-php7.0 \
    php7.0-cli \
    php7.0-common \
    php7.0-mbstring \
    php7.0-gd \
    php7.0-intl \
    php7.0-xml \
    php7.0-mysql \
    php7.0-mcrypt \
    php7.0-zip

## Intall composer
####################################################
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

## Apache - Restart
####################################################
sudo service apache2 reload
sudo service apache2 restart

## MySQL - Restart
####################################################
sudo service mysql restart