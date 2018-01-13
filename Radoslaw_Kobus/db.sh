sudo apt-get update
sudo apt-get -y install mysql-server php5-mysql
sudo mysql_install_db

mysql -u root -p
CREATE DATABASE drupal-db;
CREATE USER admin@localhost IDENTIFIED BY 'admin';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,INDEX,ALTER,CREATE TEMPORARY TABLES,LOCK TABLES ON drupal-db.* TO admin@localhost;
FLUSH PRIVILEGES;
