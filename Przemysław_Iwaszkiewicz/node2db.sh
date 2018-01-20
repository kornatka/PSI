#!/bin/sh

# skrypt for node2db
#IPADDRESS=192.168.56.5/24
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

#sudo ifconfig eth1 $IPADDRESS up
# get database
# as mentioned at: https://www.digitalocean.com/community/tutorials/how-to-create-a-multi-node-mysql-cluster-on-ubuntu-16-04
# we need to install libaio1
sudo apt -y install libaio1

#prepeare hosts in etc for easy nameing
sudo cat /vagrant/hosts >> /etc/hosts

# install previously downloaded package 
cd /vagrant 
sudo dpkg -i mysql-cluster-gpl-7.4.17-debian8-x86_64.deb

# follow step-3 as in https://www.digitalocean.com/community/tutorials/how-to-create-a-multi-node-mysql-cluster-on-ubuntu-16-04
sudo mkdir -p /usr/local/mysql/data
sudo mkdir -p /var/lib/mysql-cluster
# qRwA poniższe nie działa niewiedzieć czemu -bash: /etc/my.cnf: Permission denied
##sudo echo -e '[mysql_cluster]\nndb-connectstring=manager' > /etc/my.cnf
# więc jak nie kijem go to pałą... 
#echo "[mysql_cluster]\nndb-connectstring=managerdb" > /vagrant/my.cnf.node
# a najlepiej skopiować wcześniej przygotowany 
sudo cp -f /vagrant/my.cnf.node /etc/my.cnf

# tu poprawić: szukany ciąg to \nexit 0 a nie "exit 0"
# for autostart replace exit 0 with startup line and exit 0
#sudo sed "s@^exit 0@ifconfig eth1 $IPADDRESS up\nexit 0@g" -i.dwa /etc/rc.local
sudo sed 's/^exit 0/\/opt\/mysql\/server-5.6\/bin\/ndbd\nexit 0/g' -i.oryginal /etc/rc.local

# we run what we'v done

cd /usr/local/mysql/data
sudo /opt/mysql/server-5.6/bin/ndbd

############################################################### SPRAWDZIĆ !!!! PONIŻSZE !!!!!!!!!!!!!11
###### tu poczekać na podłączenie data node'óW
# przydałby się mechanizm czekania na pozytywny wynik podłączenia data node's do ndb_mgmd 
# ale oczekiwanie na zainstalowanie sshpass może okazać się wystarczające

#( /etc/init.d/ntp stop
#until ping -nq -c3 8.8.8.8; do  #### tu dopisać varunek podłączenia (sprawdzić jaki)
#   echo "Waiting for network..."
#done
#ntpdate -s time.nist.gov
#/etc/init.d/ntp start )&


cd /vagrant
sudo apt -y install sshpass


# tu dokończenie odpalania clastra baz:
sshpass -p vagrant ssh -oStrictHostKeyChecking=no vagrant@manager << 'ENDSSH'
cd /opt/mysql/server-5.6
sudo /opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql
# enable database service
sudo systemctl enable mysqld.service
# start database service
sudo service mysqld start

########## teraz dodać do bazy grant permission ....
########## tu opóźnienie potrzebne na start mysqld 

bin/mysql -u root < /vagrant/grant_priv.sql


ENDSSH

