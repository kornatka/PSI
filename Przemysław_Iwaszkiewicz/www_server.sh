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

## install drupal
mkdir tmp
cd tmp
wget https://ftp.drupal.org/files/projects/drupal-8.4.4.tar.gz --no-check-certificate
## copy what we'v get for future use
cp drupal-8.4.4.tar.gz /vagrant/.
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

############################################################# poniżej instalacja serwera nfs
sudo apt -y install nfs-kernel-server
echo "/var/www 192.168.56.6(rw,sync)" > exports
sudo cp exports /etc/exports
sudo service nfs-kernel-server restart


############################################################ udostępniony po nfs katalog /var/wwww


