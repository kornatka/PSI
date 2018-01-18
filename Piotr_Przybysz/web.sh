#!/bin/bash
echo 'Aktualizacja oraz sciagniecie potrzebnych aplikacji'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install php5 php5-gd php5-common php5-mysql apache2 unzip -y
service apache2 start
mkdir temp
cd temp
echo 'Pobranie Joomli oraz instalacja'
sudo wget https://downloads.joomla.org/pl/cms/joomla3/3-8-3/Joomla_3-8-3-Stable-Full_Package.zip
sudo mkdir -p /var/www/html/joomla
sudo unzip -q Joomla_3-8-3-Stable-Full_Package.zip -d /var/www/html/joomla
sudo chown -R www-data.www-data /var/www/html/joomla
sudo chmod -R 755 /var/www/html/joomla
echo 'Koniec Konifiguracji serwera ze strona www'