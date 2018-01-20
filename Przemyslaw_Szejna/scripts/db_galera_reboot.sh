#!/usr/bin/env bash

PASS="aVc7d4ZAUQJmbp6E"

sudo service mysql stop
sudo galera_new_cluster

# Wyświetlenie liczby node'ów klastrowych
mysql -u root -p$PASS -e "show status like 'wsrep_cluster_size'"