echo 'KONFIGURACJA DB'
PASS="ZAQ!2wsx#$%"
cat << EOF >> /etc/network/interfaces.d/eth1.cfg
auto eth1
iface eth0 inet dhcp
EOF
ifup eth1
sudo apt-get update
sudo apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart
mysqladmin -u root password $PASS
mysql -uroot -p$PASS -e "create database drupal"
mysql -uroot -p$PASS -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'password';"
echo 'Kończę db'