#!/bin/sh

# script managerdb 


# provisioning script for database manager (needet next two for node1 nad node2)
# system update and upgrade
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y autoclean

#chcemy mieć właściwy czas:
sudo apt -y install ntpdate
sudo ntpdate 0.pl.pool.ntp.org
sudo timedatectl set-timezone Europe/Warsaw
echo "Time snd zone set to :" ; timedatectl

#sudo ifconfig eth1 192.168.56.3/24 up
# get database
# as mentioned at: https://www.digitalocean.com/community/tutorials/how-to-create-a-multi-node-mysql-cluster-on-ubuntu-16-04
# we need to install libaio1
sudo apt -y install libaio1
sudo apt -y install libnuma1
# below needed by sudo /opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql
sudo apt -y install libdbd-mysql-perl

#prepeare hosts in etc for easy nameing
sudo cat /vagrant/hosts >> /etc/hosts

################### uwaga! w celu ściągnięcia właściwej paczki mysql odkomentować linie z 2 hash'ami ##
mkdir tmp
cd tmp
# source: https://dev.mysql.com/downloads/file/?id=473998
# and docu: https://www.digitalocean.com/community/tutorials/how-to-create-a-multi-node-mysql-cluster-on-ubuntu-16-04
wget https://dev.mysql.com/get/Downloads/MySQL-Cluster-7.4/mysql-cluster-gpl-7.4.17-debian8-x86_64.deb --no-check-certificate
# copy downloaded package to local account for future usage 
cp mysql-cluster-gpl-7.4.17-debian8-x86_64.deb /vagrant
# install downloaded package 
######### uwaga: przy rozpakowywaniu robi błąd?-sprawdzić, jeśli tak to tylko wypakować bez skryptu startowego
######sprawdzone: jest ok
cd /vagrant 
sudo dpkg -i mysql-cluster-gpl-7.4.17-debian8-x86_64.deb

# follow step-2 as in https://www.digitalocean.com/community/tutorials/how-to-create-a-multi-node-mysql-cluster-on-ubuntu-16-04
# or https://dev.mysql.com/doc/refman/5.7/en/mysql-cluster-install-configuration.html
##sudo mkdir /var/lib/mysql-cluster
BASE_DIR=/opt/mysql/server-5.6
NDB_CONF_DIR=/var/lib/mysql-cluster
LOG_DIR=/var/log/mysql
sudo mkdir $NDB_CONF_DIR
sudo cp /vagrant/config.ini $NDB_CONF_DIR
sudo cp /vagrant/my.cnf.managerdb /etc/my.cnf
sudo mkdir $LOG_DIR
# sprawdzone: sudo działa na danych zmiennych środowiskowych bo działą to:
# export $ZM_A=/var/log
# echo $ZM_A
# sudo echo $ZM_A
# tu poprawić: szukany ciąg do zastąpienia to \nexit 0 a nie "exit 0" !!!!!!!!!!!
# for autostart replace exit 0 with startup line and exit 0

########## tu odpalamy managera czyli: ndb_mgmd 
#sudo sed -i.oryginal 's/^exit 0/ifconfig eth1 192.168.56.3\/24 up\nexit 0/g' /etc/rc.local
#sudo sed -i 's/^exit 0/\/opt\/mysql\/server-5.6\/bin\/ndb_mgmd -f \/opt\/mysql\/server-5.6\/mysql-cluster\/config.ini\nexit 0/g' /etc/rc.local
sudo sed "s@^exit 0@$BASE_DIR\/bin\/ndb_mgmd -f $NDB_CONF_DIR\/config.ini\nexit 0@g" -i.oryginal /etc/rc.local
# run management: 
sudo $BASE_DIR/bin/ndb_mgmd -f $NDB_CONF_DIR/config.ini
# sprawdzić czy za pierwszym razem nie ma być:
#sudo $BASE_DIR/bin/ndb_mgmd --initial -f $NDB_CONF_DIR/config.ini
########## tu powinno już być odpalone ndb_mgm!!!!!!!!! (sprawdzić)
#### sprwdzone - ok

## tu dodać usera: 
sudo groupadd mysql
sudo useradd -r -g mysql -s /bin/false mysql
# tu zmiana uprawnień dostępu dla mysqld
sudo mkdir -p $BASE_DIR/data
sudo chown -R mysql:mysql $BASE_DIR/data
#nie wiem po co ale trzeba:
sudo mkdir -p /var/lib/mysql-files
# copy startup script do default location
sudo cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysqld

####################################################################################
# poniższe dopiero po podniesieniu data host's i podłączeniu data node's
# umieszczono w node2db.sh


#sudo /opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql
# enable database service
#sudo systemctl enable mysqld.service
# and run database not only management 
#sudo systemctl start mysqld
################################# ta część dopiero po uruchomieniu node1 i node2 
###
###		UWAGA !!!!
### Tu dopisać skrypt czekający na odpalenie i skonfigurowanie node1db oraz node2db 
### sprawdzić czy trzeba czy mysqld a wcześniej ndb_mgmd same "poczekają" na nody danych!!!
#sudo service mysqld start


######### teraz skład danych:  ndbd
#echo -e "[mysqld]\nndbcluster # run NDB storage engine" > /vagrant/my.cnf.managerdb
#sudo cp /vagrant/my.cnf.managerdb /etc/my.cnf
#sudo sed "s@^exit 0@$BASE_DIR\/bin\/ndbd\nexit 0@g" -i /etc/rc.local
#sudo $BASE_DIR/bin/ndbd


