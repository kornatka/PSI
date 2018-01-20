#!/bin/bash
echo 'web conf'
cat << EOF >> /etc/network/interfaces.d/eth1.cfg
auto eth1
iface eth0 inet dhcp
EOF
ifup eth1
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim nano mc screen

sudo apt-get install php5 php5-gd php5-common php5-mysql -y
sudo apt-get install apache2 -y
service apache2 start
sudo wget http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz
sudo tar xzvf drupal*
cd drupal*
sudo rsync -avz . /var/www/html
sudo mkdir -p /var/www/html/sites/default/files
sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
sudo chmod 664 /var/www/html/sites/default/settings.php
chmod a+w /var/www/html/sites/default/files
sudo chown -R :www-data /var/www/html/*
sudo rm /var/www/html/index.html
echo 'web end'