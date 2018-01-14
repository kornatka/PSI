Vagrant.configure("2") do |config|
  
config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.hostname = 'db'
    db.vm.network "private_network", ip: "192.168.56.2"
    db.vm.box_url = "ubuntu/xenial64"

    db.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "db"]
    end
    db.vm.provision "shell", path: "db.sh"
  end


  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/xenial64"
    web.vm.hostname = 'web'
    web.vm.network "private_network", ip: "192.168.56.3"
	web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.box_url = "ubuntu/xenial64"

    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "web"]
    end
    web.vm.provision "shell", path: "web.sh"
  end
end
