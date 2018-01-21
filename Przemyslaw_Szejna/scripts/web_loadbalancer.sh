sudo apt-get update

# Dodajemy repo dla nginxa
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update && sudo apt-get upgrade -y

# Instalacja nginxa
sudo apt-get install -y software-properties-common nginx pen

# Skopiowanie pliku konfiguracyjnego dla load balancera
mv /tmp/nginx.conf /etc/nginx/sites-available/default

# Restart usługi
service nginx restart