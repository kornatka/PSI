sudo apt-get update
sudo apt-get -y upgrade

sudo ifconfig eth1 192.168.0.19

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password haslo"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password haslo"

sudo apt-get -y install mysql-server

mysql -uroot -phaslo -e "CREATE DATABASE drupal"
mysql -uroot -phaslo -e "CREATE USER damian"
mysql -uroot -phaslo -e "GRANT ALL PRIVILEGES ON drupal.* TO 'damian' IDENTIFIED BY 'haslo'"
mysql -uroot -phaslo -e "FLUSH PRIVILEGES"

