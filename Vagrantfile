# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.define "puppet", primary: true do |puppet|
		puppet.vm.box = "sbeliakou/centos-7.2-x86_64"
		puppet.vm.hostname = "client"
		puppet.vm.network "private_network", ip: "192.168.25.110"
		puppet.vm.network "forwarded_port", guest: 80, host: 9000
                #puppet.vm.network "forwarded_port", guest: 443, host: 9443
		puppet.vm.provider "virtualbox" do |machine|
			machine.name = "puppet-exittask"
			machine.cpus = 1
			machine.memory = 1100
		end
		puppet.vm.provision "shell", inline: "echo This is Puppet exit task"
		puppet.vm.provision "shell", path: "puppet.sh"
		end

end
