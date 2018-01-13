sudo apt-get update
sudo apt-get -y install mysql-server php5-mysql
sudo mysql_install_db

mysql -u root -p
CREATE DATABASE drupal;
CREATE USER drupaluser@localhost IDENTIFIED BY 'password';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,INDEX,ALTER,CREATE TEMPORARY TABLES,LOCK TABLES ON drupal.* TO drupaluser@localhost;
FLUSH PRIVILEGES;