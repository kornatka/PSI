#!/bin/bash
# update paczek dla kernela systemu
sudo apt-get update
# aktualizowanie paczek/programów
sudo apt-get upgrade -y
# instalacja vima i programów pomocniczych
sudo apt-get install -y vim nano mc screen

# instalacja php
sudo apt-get install php5 php5-gd php5-common php5-mysql -y
# instalacja serwera apache2
sudo apt-get install apache2 -y
# start serwera apache2
service apache2 start
# pobranie najnowszej wersji drupala
sudo wget https://ftp.drupal.org/files/projects/drupal-8.4.5.tar.gz
# rozpakowanie drupala
sudo tar xzvf drupal*

# wejście do katalogu drupala
cd drupal*

# zsynchronizowanie katalogu gdzie umieszczane są pliki apache
sudo rsync -avz . /var/www/html
# strowzenie rekursywne katalogu
sudo mkdir -p /var/www/html/sites/default/files
# skopiowanie szablonowego pliku z ustawieniami drupala
sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
# nadanie uprawnień
sudo chmod 664 /var/www/html/sites/default/settings.php
chmod a+w /var/www/html/sites/default/files

# przydzielenie updawnień do plików dla apache
sudo chown -R :www-data /var/www/html/*
# usunięcie domyślnego pliku na których kierowany jest ruch
sudo rm /var/www/html/index.html
