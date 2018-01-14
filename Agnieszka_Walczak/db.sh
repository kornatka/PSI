#!/bin/bash
PASS="NoweHaslo123!"
ifup eth1
sudo apt-get update
sudo apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
service mysql status
sudo service mysql restart
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database drupal"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'password';"
