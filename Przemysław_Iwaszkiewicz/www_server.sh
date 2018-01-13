#!/bin/sh

# skrypt for www_server
#IPADDRESS=192.168.56.2/24
# provisioning script for database manager (needet next two for node1 nad node2)
# system update and upgrade
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y autoclean

#chcemy mieć właściwy czas:
sudo apt -y install ntpdate
sudo ntpdate 0.pl.pool.ntp.org
sudo timedatectl set-timezone Europe/Warsaw
echo "Time snd zone set to :" ; timedatectl

# uzupełniamy nazwy hostów
sudo cat /vagrant/hosts >> /etc/hosts

####################################################### na razie dotąd, "na piechotę" i ująć w skrypt
# wymagane przez drupal:
sudo apt -y install apache2
sudo apt -y install php-mdb2-driver-mysql 
sudo apt -y install libapache2-mod-php
sudo apt -y install php7.0-gd

## wymagane przed mysqld:
#sudo apt -y install libaio1
#sudo apt -y install libnuma1


#cd /vagrant
## update hosts names
#sudo cat hosts >> /etc/hosts
## install mysql 
#sudo dpkg -i mysql-cluster-gpl-7.4.17-debian8-x86_64.deb
#sudo cp -f /vagrant/my.cnf.node /etc/my.cnf
#BASE_DIR=/opt/mysql/server-5.6
#NDB_CONF_DIR=/var/lib/mysql-cluster
#LOG_DIR=/var/log/mysql
### tu dodać usera: 
#sudo groupadd mysql
#sudo useradd -r -g mysql -s /bin/false mysql
## tu zmiana uprawnień dostępu dla mysqld
#sudo mkdir -p $BASE_DIR/data
#sudo chown -R mysql:mysql $BASE_DIR/data

##nie wiem po co ale trzeba:
#sudo mkdir -p /var/lib/mysql-files
## copy startup script do default location
#sudo cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysqld
#sudo systemctl enable mysqld.service
#sudo service mysqld start




## install drupal
#mkdir tmp
#cd tmp
#wget https://ftp.drupal.org/files/projects/drupal-8.4.4.tar.gz --no-check-certificate
## copy what we'v get for future use
#cp /vagrant/drupal-8.4.4.tar.gz .
cd /vagrant
sudo tar -xzf drupal-8.4.4.tar.gz -C /var/www 
cd /var/www
sudo ln -s ./drupal-8.4.4/ drupal
sudo chmod a+w /var/www/drupal/sites/default
# wymagane w kroku 3 instalatora drupal
sudo cp /var/www/drupal/sites/default/default.settings.php /var/www/drupal/sites/default/settings.php 
sudo chmod a+w  /var/www/drupal/sites/default/settings.php

# zmiana odpalanej witryny w konfigu apacha
sed 's@DocumentRoot\ \/var\/www\/html@DocumentRoot\ \/var\/www\/drupal-8.4.4@g' -i.oryginal /etc/apache2/sites-available/000-default.conf 

sudo service apache2 restart

