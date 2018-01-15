echo 'KONFIGURACJA BAZY'

PASS="joomla"
export DEBIAN_FRONTEND=noninteractive

echo 'AKTUALIZACJA UBUNTU'

sudo apt-get update
sudo apt-get upgrade -y

echo 'INSTALACJA, KONFIGURACJA MYSQL-SERVER'

sudo -E apt-get -q -y install mysql-server
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database wordpress"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'password';"

echo 'KONIEC'
