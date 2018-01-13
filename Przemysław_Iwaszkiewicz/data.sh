sudo echo Europe/Warsaw > /etc/timezone 
sudo apt -y install ntpdate
sudo touch /etc/ntp.conf
sudo echo "
server 0.pl.pool.ntp.org
server 1.pl.pool.ntp.org
server 2.pl.pool.ntp.org
server 3.pl.pool.ntp.org
broadcast 192.168.56.255
" > /etc/ntp.conf

#broadcast 192.168.123.255
