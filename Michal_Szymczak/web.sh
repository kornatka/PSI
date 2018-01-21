echo 'KONFIGURACJA WEB'

echo 'AKTUALIZACJA UBUNTU'

sudo DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y

echo 'INSTALACJA PHP, APACHE2, INNE'

sudo apt-get install php5 php5-gd php5-common php5-mysql apache2 unzip -y
service apache2 start
mkdir temp
cd temp

echo 'Pobranie wordpress i rozpakowanie'

sudo wget https://wordpress.org/latest.zip
sudo mkdir -p /var/www/html/wordpress
sudo unzip -q latest.zip -d /var/www/html/
sudo chown -R www-data.www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress

echo 'KONIEC'
echo '192.168.100.101/wordpress/'