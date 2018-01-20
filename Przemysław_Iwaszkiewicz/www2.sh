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


################################### tu jeszcze konfig apache

############################################################# poniżej instalacja klienta nfs
sudo service apache2 stop

sudo apt -y install nfs-common
sudo rm -R /var/www/*
sudo mount -t nfs 192.168.56.2:/var/www /var/www
ed 's@DocumentRoot\ \/var\/www\/html@DocumentRoot\ \/var\/www\/drupal-8.4.4@g' -i.oryginal /etc/apache2/sites-available/000-default.conf
sudo service apache2 start

##################### tu jeszcze raz dziennie skopiować dane z /var/www do innego folderu
sudo mkdir -p /backup

echo "cp -R /var/www /backup" >> nic
sudo mv nic /etc/cron.daily/make-www-backup
sudo chmod +x /etc/cron.daily/make-www-backup



