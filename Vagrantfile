# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # This VM defines the vm that will pull data
  # from the dbserver and display it on a php page
  config.vm.define "display" do |display|
	# This is the name of this vm
	display.vm.hostname = "display"
	
	# This network is where we port forward to our local loopback server
	display.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
	
	# This network is our private network where the vm's will communicate
	display.vm.network "private_network", ip: "192.168.2.11"
	
	# This is where we set up our synced folders on our physical machine
	display.vm.synced_folder ".", "/vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
	
	# This line calls our shell script to set up our vm when it boots
	display.vm.provision "shell", path: "display.sh"
  end
	
	
  # This VM defines the vm that will save data
  # from the input pge to a mysql database
  config.vm.define "dbserver" do |dbserver|
	# This is the name of this vm
	dbserver.vm.hostname = "dbserver"
	
	# This network is our private network where the vm's will communicate
	dbserver.vm.network "private_network", ip: "192.168.2.12"
	
	# This is where we set up our synced folders on our physical machine
	dbserver.vm.synced_folder ".", "/vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
	
	# This line calls our shell script to set up our vm when it boots
	dbserver.vm.provision "shell", path: "dbserver.sh"
  end
	
	# This VM defines the vm that will save data
  # from the input pge to a mysql database
  config.vm.define "upload" do |upload|
	# This is the name of this vm
	upload.vm.hostname = "upload"
	
	# This network is where we port forward to our local loopback server
	# the host port must be different from the display VM since they would otherwise clash
	upload.vm.network "forwarded_port", guest: 80, host: 8090, host_ip: "127.0.0.1"
	
	  # This network is our private network where the vm's will communicate
	upload.vm.network "private_network", ip: "192.168.2.10"
	
	# This is where we set up our synced folders on our physical machine
	upload.vm.synced_folder ".", "/vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
	
	# This line calls our shell script to set up our vm when it boots
	upload.vm.provision "shell", path: "upload.sh"
  end
end
