PASS="12345"

ifup eth1
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim nano mc screen iftop iptraf

export DEBIAN_FRONTEND=noninteractive

sudo -E apt-get -q -y install mysql-server
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

service mysql status

sudo service mysql restart
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database drupal"
#mysql -uroot -p$PASS -e "grant all privileges on drupal.* to 'drupal'@'%' identifide by 'drupal!'"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'password';"