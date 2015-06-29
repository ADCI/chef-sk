VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Install latest chef via omnibus plugin.
  config.omnibus.chef_version = :latest

  config.vm.box = "Debian Jessie x64"
  config.vm.box_url = "https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box"

  config.vm.network :forwarded_port, host: 4567, guest: 4567
  #config.vm.network :forwarded_port, host: 8080, guest: 8080

  #config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "public_network", ip: "10.1.1.20"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    # Improve network perfomance
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    #vb.customize ["modifyvm", :id, "--ioapic", "on"]
    #vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "php5-fpm::install"
    chef.add_recipe "nginx"
    chef.add_recipe "mariadb"
    chef.add_recipe "phing"
    chef.add_recipe "drush"
    chef.add_recipe "phpapp"

    chef.json = {
      "project" => {
        "sites" => {
          "site" => {
            "port" => 4567,
            "dir" => "/var/www/site"
          },
        },
      }
    }

  end

end
