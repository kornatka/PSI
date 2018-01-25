sudo apt update
 
sudo apt -y full-upgrade

sudo apt -y install apache2
sudo apt -y install php-mdb2-driver-mysql 
sudo apt -y install libapache2-mod-php
sudo apt -y install php7.0-gd


mkdir -p tmp
cd tmp
wget https://ftp.drupal.org/files/projects/drupal-8.4.4.tar.gz --no-check-certificate
sudo tar -xzf drupal-8.4.4.tar.gz -C /var/www 

cd /var/www
sudo ln -s ./drupal-8.4.4/ drupal
sudo chmod a+w /var/www/drupal/sites/default
# wymagane w kroku 3 instalatora drupal
sudo cp /var/www/drupal/sites/default/default.settings.php /var/www/drupal/sites/default/settings.php 
sudo chmod a+w  /var/www/drupal/sites/default/settings.php

# zmiana odpalanej witryny w konfigu apacha
sed 's@DocumentRoot\ \/var\/www\/html@DocumentRoot\ \/var\/www\/drupal-8.4.4@g' -i.oryginal /etc/apache2/sites-available/000-default.conf 

sudo service apache2 restart
