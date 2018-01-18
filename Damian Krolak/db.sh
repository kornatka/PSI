sudo apt-get update
sudo apt-get -y upgrade

#sudo ifconfig eth1 192.168.0.19
sudo ifconfig eth1 192.168.43.111

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password haslo"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password haslo"

sudo apt-get -y install mysql-server

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart

mysql -uroot -phaslo -e "CREATE DATABASE drupal"
mysql -uroot -phaslo -e "CREATE USER damian"
mysql -uroot -phaslo -e "GRANT ALL PRIVILEGES ON drupal.* TO 'damian' IDENTIFIED BY 'haslo'"
mysql -uroot -phaslo -e "FLUSH PRIVILEGES"

