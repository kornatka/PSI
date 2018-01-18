#!/bin/bash
PASS="joomla"
export DEBIAN_FRONTEND=noninteractive
echo 'Aktualizacja Linuxa oraz sciagniecie potrzebnych aplikacji'
sudo apt-get update
sudo apt-get upgrade -y
sudo -E apt-get -q -y install mysql-server
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart
echo 'Tworzenie bazy, nadawanie uprawnien uzytkownikowi'
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database joomla"
#mysql -uroot -p$PASS -e "grant all privileges on joomla.* to 'joomla'@'%' identifide by 'joomla!'"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON joomla.* TO 'joomla'@'%' IDENTIFIED BY 'password';"
echo 'Zakonczona konfiguracja serwera z baza'