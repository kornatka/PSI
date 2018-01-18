sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y  php7.0 php7.0-curl php7.0-gd php7.0-mbstring php7.0-xml php7.0-json php7.0-mysql php7.0-opcache libapache2-mod-php7.0
sudo service apache2 restart
sudo apt-get update

cd /var/www
sudo wget https://ftp.drupal.org/files/projects/drupal-8.3.7.tar.gz
sudo tar xvzf drupal-8.3.7.tar.gz
cd drupal-8.3.7
sudo mv ./* /var/www/html
sudo chown -R www-data:www-data /var/www/html
