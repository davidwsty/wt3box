#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

## Install parameters
####################################################
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password root'

debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-user string root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'

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

## Install MYSQL
####################################################
sudo apt -y install mysql-server-5.7

## MYSQL Security fix
####################################################
sudo mysql_secure_installation

## Allow MYSQL connection
####################################################
sudo sed -i "s/.*bind-address.*/# bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

## Apache - Restart
####################################################
sudo service apache2 reload
sudo service apache2 restart

## MySQL - Restart
####################################################
sudo service mysql restart

## Install PHP7
####################################################
sudo apt -y install php7.0 \
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

## Install phpmyadmin
####################################################
sudo apt -y install phpmyadmin

## Intall composer
####################################################
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

## Apache - Vhosts
####################################################
sudo cp /project/dev/vagrantprovisioning/vhosts/* /etc/apache2/sites-available/
sudo a2dissite 000-default
sudo a2ensite project

## Apache - Restart
####################################################
sudo service apache2 reload
sudo service apache2 restart

## MySQL - Restart
####################################################
sudo service mysql restart