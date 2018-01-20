PASS="haslo"
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y install mysql-server php5-mysql
service mysql status
sudo service mysql restart
mysqladmin -u root haslo $PASS
mysql -uroot -p$PASS -e "create database drupal"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'haslo';"