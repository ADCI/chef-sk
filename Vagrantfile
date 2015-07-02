VAGRANT_API_VERSION = 2

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # Install latest chef via omnibus plugin.
  config.omnibus.chef_version = :latest

  # Debian Jessie x64
  config.vm.box = "debian/jessie64"

  config.vm.network :forwarded_port, host: 4567, guest: 80

  config.vm.network "private_network", ip: "172.16.0.2"
  #config.vm.network "public_network", ip: "10.1.1.20"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024

    # Improve network perfomance
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.roles_path = "roles"
    chef.add_role("developer")
  end

end
