sudo apt update
sudo apt -y full-upgrade

sudo apt -y install mariadb-server

mysql -u root << SKRYPT
create database drupal;
GRANT ALL PRIVILEGES ON *.* TO 'magda'@'*' IDENTIFIED BY 'qwerty' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'drupal'@'192.168.56.2' IDENTIFIED BY 'qwerty1' WITH GRANT OPTION;
