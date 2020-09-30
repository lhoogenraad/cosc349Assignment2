# -*- mode: ruby -*-
# vi: set ft=ruby :


class Hash
  def slice(*keep_keys)
    h = {}
    keep_keys.each { |key| h[key] = fetch(key) if has_key?(key) }
    h
  end unless Hash.method_defined?(:slice)
  def except(*less_keys)
    slice(*keys - less_keys)
  end unless Hash.method_defined?(:except)
end


Vagrant.configure("2") do |config|

  # This is a dummy box as AWS doesn't need to use a vagrant box file
  config.vm.box = "dummy"


	config.vm.provider :aws do |aws, override|
		# The region for Amazon Educate is fixed. Our region is us-east-1
		aws.region = "us-east-1"

		# These options force synchronisation of files to the VM's
		# /vagrant directory using rsync, rather than using trying to use
		# SMB (which will not be available by default).
		override.nfs.functional = false
		override.vm.allowed_synced_folder_types = :rsync
		
		# The keypair_name parameter tells Amazon which public key to use.
		aws.keypair_name = "cosc349-lab9"
		# This is the path to our private key.
		override.ssh.private_key_path = "~/.ssh/cosc349-lab9.pem"

		# Choose your Amazon EC2 instance type (t2.micro is cheap).
		aws.instance_type = "t2.micro"

		# You need to indicate the list of security groups your VM should
		# be in. Each security group will be of the form "sg-...", and
		# they should be comma-separated (if you use more than one) within
		# square brackets.
		#
		aws.security_groups = ["sg-001778758a9950696", "sg-0ca77cbf975ff3daa"]

		# For Vagrant to deploy to EC2 for Amazon Educate accounts, it
		# seems that a specific availability_zone needs to be selected
		# (will be of the form "us-east-1a"). The subnet_id for that
		# availability_zone needs to be included, too (will be of the form
		# "subnet-...").
		aws.availability_zone = "us-east-1f"
		aws.subnet_id = "subnet-0a48d504"
		
		# This tells aws what disk image to use.
		# This one is a pretty standard ubuntu image.
		aws.ami = "ami-0f40c8f97004632f9"
		
		# If using Ubuntu, you probably also need to uncomment the line
		# below, so that Vagrant connects using username ubuntu
		override.ssh.username = "ubuntu"
		
	end


  # This VM defines the vm that will pull data
  # from the dbserver and display it on a php page
  config.vm.define "display" do |display|
	# This is the name of this vm
	display.vm.hostname = "display"
	
	# This network is where we port forward to our local loopback server
	display.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
	
	# This network is our private network where the vm's will communicate, i believe this isn't
	# required when operating on AWs
	#display.vm.network "private_network", ip: "192.168.2.11"
	
	# This line calls our shell script to set up our vm when it boots
	display.vm.provision "shell", path: "display.sh"
  end
	
	
  # This VM defines the vm that will save data
  # from the input pge to a mysql database
  config.vm.define "dbserver" do |dbserver|
	# This is the name of this vm
	dbserver.vm.hostname = "dbserver"
	
	# This network is our private network where the vm's will communicate
	#dbserver.vm.network "private_network", ip: "192.168.2.12"
	
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
		
	# This is where we set up our synced folders on our physical machine
	#upload.vm.synced_folder ".", "/vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
	
	# This line calls our shell script to set up our vm when it boots
	upload.vm.provision "shell", path: "upload.sh"
  end
end
