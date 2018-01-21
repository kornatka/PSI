#!/bin/bash
echo 'Rozpoczynam konfigurację bazy danych'
PASS="aVc7d4ZAUQJmbp6E"

sudo apt-get update
sudo apt-get upgrade -y

# Dodanie do repo kluczy od MariaDB
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.1/ubuntu xenial main'
sudo apt-get update -y

# Automatyczne wstawienie hasła w miejsce promptów
sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password password aVc7d4ZAUQJmbp6E'
sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password_again password aVc7d4ZAUQJmbp6E'

# Instalacja MariaDB
sudo apt-get install mariadb-server rsync -y

# Konfigurowanie instalacji, m.in. umożliwienie logowania z zewnątrz i usunięcie testowej bazy z testowym userem
#echo -e "$PASS\nn\nY\nn\nY\nY\n" | mysql_secure_installation

# Przeniesienie pliku konfiguracyjnego dla klastra bazodanowego
sudo mv /tmp/galera.conf /etc/mysql/conf.d/galera.cnf

sudo systemctl start mysql

echo 'Zakończyłem konfigurację bazy danych'

