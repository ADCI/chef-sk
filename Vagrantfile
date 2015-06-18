VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Install latest chef via omnibus plugin.
  config.omnibus.chef_version = :latest

  config.vm.box = "Ubuntu 14.10 x32"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-i386-vagrant-disk1.box"

  config.vm.network :forwarded_port, host: 4570, guest: 4570
  #config.vm.network :forwarded_port, host: 8080, guest: 8080

  #config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "public_network", ip: "10.1.0.125"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    # Improve network perfomance
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    #vb.customize ["modifyvm", :id, "--ioapic", "on"]
    #vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end

    config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "nginx"
    end

end
