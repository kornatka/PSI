sudo apt update
sudo apt -y full-upgrade

sudo apt -y install mariadb-server

mysql -u root << SKRYPT
create database drupal;
GRANT ALL PRIVILEGES ON *.* TO 'ARIPc'@'*' IDENTIFIED BY 'A123qwer' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'drupal'@'192.168.10.10' IDENTIFIED BY 'A123qwer' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.10.11' IDENTIFIED BY 'A123qwer' WITH GRANT OPTION;


SKRYPT

