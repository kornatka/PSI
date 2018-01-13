#!/bin/bash
echo 'Rozpoczynam konfiguracje serwera web'
PASS="Mojehaslo1"
cat << EOF >> /etc/network/interfaces.d/eth1.cfg
auto eth1
iface eth0 inet dhcp
EOF
ifup eth1
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim nano mc screen iftop iptraf
#sudo get  http://ftp.drupal.org/files/projects/drupal-7.15.tar.gz
#sudo tar zxvf drupal-7.15.tar.gz
#sudo mkdir /var/www/
#sudo mv drupal-7.15/* /var/www/
#sudo apt-get install php5 php5-gd php5-mysql -y

#mySQL
# automatyczne potwierdzanie promptów
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
#regexp
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
service mysql status
sudo service mysql restart
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database drupal"
#mysql -uroot -p$PASS -e "grant all privileges on drupal.* to 'drupal'@'%' identifide by 'drupal!'"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'password';"
#mySQL
sudo apt-get install php5-gd php5-curl libssh2-php -y
sudo apt-get install apache2 -y
service apache2 start
sudo wget http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz
sudo tar xzvf drupal*
cd drupal*
sudo rsync -avz . /var/www/html
sudo mkdir /var/www/html/sites/default/files
sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
sudo chmod 664 /var/www/html/sites/default/settings.php
sudo chown -R :www-data /var/www/html/*
echo 'Kończę web'


