# Opis serwerów

- 192.168.50.11 - pierwszy webserwer z wordpressem
- 192.168.50.12 - drugi webserwer z wordpressem
- 192.168.50.20 - node bazy MariaDB z galera cluster
- 192.168.50.21 - node bazy MariaDB
- 192.168.50.22 - node bazy MariaDB
- 192.168.50.10 - load balancer dla serwerów wordpressa (nginx)
- 192.168.50.25 - load balancer dla baz danych (haproxy)

Strona uruchamiana przez adres [http://192.168.50.10/](http://192.168.50.10/)

autor: Przemysław Szejna

nr indeksu 30486