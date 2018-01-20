sudo apt-get -y update
sudo apt-get -y upgrade

# Instalacja pehapa i apacza
sudo apt-get install -y apache2 php5 php5-gd php5-common php5-mysql zip vim

# Dodanie rozszerzenia do apacza by przekształcał urle
sudo a2enmod rewrite
sudo service apache2 restart

# Tworzę katalog do umieszczania stron www
mkdir /var/www/html
cd /var/www/html


sudo chown -R :www-data /var/www/*

# Rozpakowujemy wordpressa
wget https://pl.wordpress.org/wordpress-4.9.1-pl_PL.zip
unzip wordpress*
rm wordpress-*

# Konfigurujemy wordpressa i apacza
mv /tmp/wordpress.config.php /var/www/html/wordpress/wp-config.php
mv /tmp/wordpress.conf /etc/apache2/sites-available/wordpress.conf
a2ensite wordpress.conf

# Restart apacza
service apache2 restart

# Nadajemy uprawnienia dla Apacza
sudo chown :www-data /var/www/html/wordpress -R

# Nadajemy uprawnienia dla katalogi wp-content do uploadu pików przez wordpressa
sudo chmod 777 /var/www/html/wordpress/wp-content -R