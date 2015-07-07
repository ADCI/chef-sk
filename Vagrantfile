VAGRANT_API_VERSION = 2

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # Prepare base box.
  # Debian Jessie x64
  config.vm.box = "debian/jessie64"

  # Create private network interface for communicate host and virtual machines
  config.vm.network "private_network", ip: "172.16.0.2"

  # Create bridge network interface.
  #config.vm.network "public_network", ip: "10.1.1.20"

  # Also you can set forwarded ports (don't recommended)
  #config.vm.network :forwarded_port, host: 4567, guest: 80

  # Set hostname for virtual machine
  config.vm.hostname = "vagrant.local"

  # Customize provider.
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024

    # Improve network perfomance
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # Enable vagrant-hostsupdater support, if the plugin is installed
  # see https://github.com/cogitatio/vagrant-hostsupdater for details
  if Vagrant.has_plugin?("vagrant-hostsupdater")
    # config.hostsupdater.aliases = []
  end

  # Install latest Chef via omnibus plugin.
  config.omnibus.chef_version = :latest

  # Settings for Chef provisioner.
  config.vm.provision "chef_solo" do |chef|
    chef.roles_path = "chef/roles"
    chef.add_role("developer")
  end

end
