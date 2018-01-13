sudo apt-get -y update

sudo apt-get install -y apache2
sudo apt-get install -y php5 php5-gd php5-common php5-mysql

sudo a2enmod rewrite
sudo service apache2 restart

sudo apt-get -y upgrade

sudo wget http://ftp.drupal.org/files/projects/drupal-7.32.tar.gz
sudo tar -xvzf drupal-7.32.tar.gz
rmdir drupal-7.32.tar.gz

cd drupal*
sudo rsync -avz . /var/www

cd /var/www/
cp sites/default/default.settings.php sites/default/settings.php
chmod a+w sites/default/settings.php
chmod a+w sites/default

sudo chown -R :www-data /var/www/*

