DOKUMENTACJA DO PRZEDMIOTU PSI

Docker Compose jest narzędziem do definiowania i uruchamiania wielu kontenerów naraz. 
Definicje tworzymy w pliku docker-compose.yml, gdzie za pomocą notacji YAML opisujemy elementy infrastruktury. 
Uruchamia aplikację Dockera z wieloma kontenerami (uruchamia wszystkie usługi ze swojej konfiguracji) Kontener to instancja obrazu. 
Z tego samego obrazu można stworzyć kilka kontenerów, które będą działać na tym samym jądrze (tego samego systemu). 
Tworzy warstwy dla każdej maszyny. Docker compose porozumiewa się z Docker za pomocą API.


Server Version: 17.12.0-ce
Storage Driver: overlay2
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host ipvlan macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 89623f28b87a6004d4b785663257362d1658a729
runc version: b2567b37d7b75eb4cf325b77297b140ea686ce8f
init version: 949e6fa
Security Options:
 seccomp
  Profile: default
Kernel Version: 4.9.60-linuxkit-aufs
Operating System: Docker for Windows
OSType: linux
Architecture: x86_64
CPUs: 2
Total Memory: 1.934GiB
Name: linuxkit-00155d380110
ID: 4UV3:YJ3O:V3EU:RMTW:GTWU:W2Q2:B3UE:NJY5:VIKO:UISS:P4R4:KWBC
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): true
 File Descriptors: 46
 Goroutines: 65
 System Time: 2018-01-21T15:00:46.8186513Z
 EventsListeners: 2
Registry: https://index.docker.io/v1/
Labels:
Experimental: true
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false
