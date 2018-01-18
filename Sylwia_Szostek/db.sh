sudo apt-get update
sudo apt-get -y install mysql-server php5-mysql

HASLO="haslo"
mysqladmin -u root password haslo

mysql -u root -p$HASLO -e "CREATE DATABASE drupal;"
mysql -u root -p$HASLO -e "CREATE USER drupaluser@localhost IDENTIFIED BY 'haslo';"
mysql -u root -p$HASLO -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,INDEX,ALTER,CREATE TEMPORARY TABLES,LOCK TABLES ON drupal.* TO drupaluser@localhost;"
mysql -u root -p$HASLO -e "FLUSH PRIVILEGES;"