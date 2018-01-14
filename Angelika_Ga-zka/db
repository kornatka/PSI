sudo apt update
sudo apt -y full-upgrade

sudo apt -y install mariadb-server

mysql -u root << SKRYPT
create database drupal;
GRANT ALL PRIVILEGES ON *.* TO 'ANGELA'@'*' IDENTIFIED BY 'ABC12' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'drupal'@'192.168.56.2' IDENTIFIED BY 'ABC1212' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.56.2' IDENTIFIED BY 'ABC12' WITH GRANT OPTION;


SKRYPT

