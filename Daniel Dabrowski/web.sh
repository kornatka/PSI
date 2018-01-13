#sudo apt-get install -y  python-software-properties
 #sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
 #sudo debconf-set-selections <<< "mariadb-server mariadb-server/root_password password abc"
 #sudo debconf-set-selections <<< "mariadb-server mariadb-server/root_password_again password abc"
 #sudo apt-get install -y  mariadb-server
 
 #sudo service mysql restart
 
 sudo add-apt-repository -y ppa:ondrej/php
 sudo apt-get update
 
 
 sudo apt-get install -y  php7.0 php7.0-curl php7.0-gd php7.0-mbstring php7.0-xml php7.0-json php7.0-mysql php7.0-opcache libapache2-mod-php7.0
 
 #sudo echo -e "\n\nabc\nabc\n\n\nn\n\n " | mysql_secure_installation 2>/dev/null
 #sudo cp /vagrant/my.cnf /etc/mysql/my.cnf
 
 sudo service apache2 restart
 #sudo service mysql restart
 
 #mysql -u root -p
 
 
 cd /var/www
 
 sudo wget https://ftp.drupal.org/files/projects/drupal-8.3.7.tar.gz
 
 sudo tar xvzf drupal-8.3.7.tar.gz
 
 cd drupal-8.3.7
 
 sudo mv ./* /var/www/html
 
 sudo chown -R www-data:www-data /var/www/html