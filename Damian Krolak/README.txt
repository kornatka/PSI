Projekt Vagrant Drupal

Opis: Utworzenie dwóch maszyn wirtualnych, jednej zawierającej instalator CMS - Drupal, drugiej zawierającej pakiet mysql z przygotowaną bazą danych. Efektem końcowym jest poprawne zainstalowanie CMS.

W celu uruchomienia projektu:

- Pobrać oraz zainstalować program VirtualBox (link poniżej) 

- Pobrać oraz zainstalować program Vagrant (link poniżej)

- W katalogu z plikiem konfiguracyjnym Vagrantfile, wykonać komendę vagrant up. Spowoduje to rozpoczęcie tworzenia się     naszych maszyn wirtualnych (zdjęcie vagrant_up.png)


- Po zakończonym procesie tworzenia maszyn wirtualnych, za pomocą przeglądarki, przejść pod adres     https://192.168.43.110/install.php. 

- Poprawane wykonanie wcześniejszych kroków, spowoduje rozpoczęcie instalacji Drupal'a (zdjęcie instalacja1.png)

- Przejście do kolejnego kroku wymusza od nas podanie danych do połączenia z bazą danych. Podajemy jej dane użytkownika,   zgodnie z zapisanymi w skrypcie db.sh. Jako host bazy danych, podajemy 192.168.43.111 (zdjęcie instalacja2.png)


- W ostatnim kroku, po poprawnym połączeniu z bazą danych, instalator prosi o podanie danych użytkownika przyszłej strony   (zdjęcie instalacja3.png)



Przydatne linki:

Vrtual Box:
https://www.virtualbox.org/

Vagrant:
https://www.vagrantup.com/







