#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install php5 php5-gd php5-common php5-mysql apache2 -y
service apache2 start
cd ~
sudo wget http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz
sudo tar xzvf drupal*
cd drupal*
sudo rsync -avz . /var/www/html
cd /var/www/html
sudo mkdir /var/www/html/sites/default/files
sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
sudo chmod 664 /var/www/html/sites/default/settings.php
sudo chmod 664 /var/www/html/sites/default/files/
sudo chown -R :www-data /var/www/html/*
sudo service apache2 restart