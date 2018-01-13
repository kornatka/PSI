sudo apt-get install software-properties-common
 sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
 sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mariadb.kisiek.net/repo/10.2/ubuntu trusty main'
 
 sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password haslo_do_zmiany' 
 sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password haslo_do_zmiany'
 
 sudo apt-get  update
 sudo apt-get install -y mariadb-server