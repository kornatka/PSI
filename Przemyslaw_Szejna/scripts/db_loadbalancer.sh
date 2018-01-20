sudo apt-get update

# Dodajemy repo dla nginxa
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update && sudo apt-get upgrade -y

# Instalacja haproxy
sudo apt-get install -y software-properties-common haproxy

# Skopiowanie pliku konfiguracyjnego dla load balancera
sudo mv /tmp/haproxy.conf /etc/haproxy/haproxy.cfg

# Flaga umożliwiająca uruchomienie haproxy przez service ... start
sudo echo "ENABLED=1" > /etc/default/haproxy

# Uruchomienie haproxy
sudo service haproxy start