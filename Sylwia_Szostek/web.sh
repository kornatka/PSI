sudo apt-get update
sudo apt-get -y install apache2
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt
sudo apt-get -y install php5-gd
sudo apt-get -y install php5-mysql
sudo a2enmod rewrite
cd ~
wget http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz
tar xzvf drupal*
cd drupal*
sudo rsync -avz . /var/www/html
cd /var/www/html
sudo mkdir /var/www/html/sites/default/files
sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
sudo chmod 664 /var/www/html/sites/default/settings.php
sudo chmod 777 /var/www/html/sites/default/files/
sudo chown -R :www-data /var/www/html/*
sudo service apache2 restart