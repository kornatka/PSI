#!/usr/bin/env bash

PASS="aVc7d4ZAUQJmbp6E"

sudo service mysql restart

# Wyświetlenie liczby node'ów klastrowych
mysql -u root -p$PASS -e "show status like 'wsrep_cluster_size'"