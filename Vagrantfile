VAGRANT_API_VERSION = 2

Vagrant.configure(VAGRANT_API_VERSION) do |config|

  # Prepare base box.
  # Ubuntu Xenial 16.04 x64
  config.vm.box = 'geerlingguy/ubuntu1604'

  # Create private network interface for communicate host and virtual machines
  config.vm.network 'private_network', ip: '172.16.0.2'

  # Create bridge network interface.
  #config.vm.network 'public_network', ip: '10.1.1.20'

  # Set forwarded ports (not recommended)
  #config.vm.network :forwarded_port, host: 4567, guest: 80

  # Customize provider.
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024

    # Virtual machine name
    #vb.name = 'projectname'

    # Improve network performance
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  # Enable vagrant-hostsupdater support, if the plugin is installed
  # see https://github.com/cogitatio/vagrant-hostsupdater for details
  if Vagrant.has_plugin?('vagrant-hostsupdater')
    # Set hostname for virtual machine
    config.vm.hostname = 'site.local'

    config.hostsupdater.aliases = []
  end


  # Install latest Chef via omnibus plugin.
  config.omnibus.chef_version = :latest

  # Set file destination for Berksfile
  config.berkshelf.berksfile_path = 'chef/Berksfile'
  config.berkshelf.enabled = true

  # Settings for Chef provisioner.
  config.vm.provision 'chef_solo' do |chef|
    # You can manually add cookbook files if vagrant-berkshelf plugin is not installed
    #chef.cookbooks_path = 'chef/cookbooks/vendor'

    # Local runlist
    chef.add_recipe 'local'

  end

end
