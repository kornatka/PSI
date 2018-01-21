#!/bin/bash
echo 'konfiguruję maszynę webową'

	cat << EOF >> /etc/network/interfaces.d/eth1.cfg
auto eth1
iface eth1 inet dhcp
EOF
	ifup eth1
echo 'instaluje komponenty niezbędne di instalacji drupala(apache, php)'

	sudo apt-get install php5 php5-gd php5-common php5-mysql -y
	sudo apt-get install apache2 -y
	sudo service apache2 star
 echo 'ściągam instalacje drupala'	
	sudo wget http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz

echo 'Rozpakowywuję drupala'	
	sudo tar xzvf drupal*
cd drupal*

echo 'konfiguruje drupala'

sudo rsync -avz . /var/www/html
sudo mkdir -p /var/www/html/sites/default/files
sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
sudo chmod 664 /var/www/html/sites/default/settings.php
chmod a+w /var/www/html/sites/default/files
sudo chown -R :www-data /var/www/html/*
sudo rm /var/www/html/index.html

