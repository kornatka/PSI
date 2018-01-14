Projekt Vagrant Drupal

Opis: Utworzenie dwóch maszyn wirtualnych, jednej zawieraj¹cej instalator CMS - Drupal, drugiej zawieraj¹cej pakiet mysql z przygotowan¹ baz¹ danych. Efektem koñcowym jest poprawne zainstalowanie CMS.

W celu uruchomienia projektu:

- Pobraæ oraz zainstalowaæ program VirtualBox (link poni¿ej) 

- Pobraæ oraz zainstalowaæ program Vagrant (link poni¿ej)

- W katalogu z plikiem konfiguracyjnym Vagrantfile, wykonaæ komendê vagrant up. Spowoduje to rozpoczêcie tworzenia siê     naszych maszyn wirtualnych (zdjêcie vagrant_up.png)


- Po zakoñczonym procesie tworzenia maszyn wirtualnych, za pomoc¹ przegl¹darki, przejœæ pod adres     https://192.168.43.110/install.php. 

- Poprawane wykonanie wczeœniejszych kroków, spowoduje rozpoczêcie instalacji Drupal'a (zdjêcie instalacja1.png)

- Przejœcie do kolejnego kroku wymusza od nas podanie danych do po³¹czenia z baz¹ danych. Podajemy jej dane u¿ytkownika,   zgodnie z zapisanymi w skrypcie db.sh. Jako host bazy danych, podajemy 192.168.43.111 (zdjêcie instalacja2.png)


- W ostatnim kroku, po poprawnym po³¹czeniu z baz¹ danych, instalator prosi o podanie danych u¿ytkownika przysz³ej strony   (zdjêcie instalacja3.png)



Przydatne linki:

Vrtual Box:
https://www.virtualbox.org/

Vagrant:
https://www.vagrantup.com/







