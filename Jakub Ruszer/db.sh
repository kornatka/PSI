#!/bin/bash

# zmienna środowiskowa z hasłem
PASS="12345"

# update repozytorium
sudo apt-get update
# aktualizowanie paczek
sudo apt-get upgrade -y
# instalacja programów pomocniczych
sudo apt-get install -y vim nano mc screen iftop iptraf

# zmienna środowiskowa. Dzięki niej instalacja mysql nie będzie pytała o hasło dla roota. 
# utworzony zostanie root bez hasła
export DEBIAN_FRONTEND=noninteractive

# instalacja mysql serwera
sudo -E apt-get -q -y install mysql-server
# podmiana adresu w pliku my.cnf
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# wyświetlenie statusu serwera mysql
service mysql status

# restart serwera mysql
sudo service mysql restart
# zmiana hasła dla roota
mysqladmin -u root password $PASS
# stworzenie bazy danych o nazwie drupal
mysql -uroot -p$PASS -e "create database drupal"
# nadanie uprawnień i stworzenie użytkownika drupal z hasłem password
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'password';"