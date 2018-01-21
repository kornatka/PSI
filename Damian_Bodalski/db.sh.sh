echo '------------------------------Konfiguracja bazy danych-------------------------'
PASS="Dziendobry12"
cat << EOF >> /etc/network/interfaces.d/eth1.cfg
auto eth1
iface eth1 inet dhcp
EOF
ifup eth1
sudo apt-get update
sudo apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart
echo '------------------------------------uruchomienie mySql------------------------------------------'
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database newdrupal"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupalsuser'@'%' IDENTIFIED BY 'myDrupalPassword';"
echo '-------------------------------------Koniec konfiguracji bazy-------------------------'