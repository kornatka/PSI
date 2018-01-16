Vagrant.configure("2") do |config|

	config.vm.define "baza" do |baza|
	baza.vm.box = "ubuntu/trusty64"
	baza.vm.hostname = 'baza'
	baza.vm.network "private_network", ip: "192.168.100.100"
	baza.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--memory", 1024]
		v.customize ["modifyvm", :id, "--cpus", 1]
		v.customize ["modifyvm", :id, "--name", "misiek_baza"]
    		end
    			baza.vm.provision "shell", path: "db.sh"
 	end

	config.vm.define "web" do |web|
	web.vm.box = "ubuntu/trusty64"
	web.vm.hostname = 'baza'
	web.vm.network "private_network", ip: "192.168.100.101"
	web.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--memory", 1024]
		v.customize ["modifyvm", :id, "--cpus", 1]
		v.customize ["modifyvm", :id, "--name", "misiek_web"]
    		end
    			web.vm.provision "shell", path: "web.sh"
 	end
end