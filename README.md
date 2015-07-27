# Vagrant True

## Required packages:

 - [Virtualbox](https://www.virtualbox.org/)
 - [Vagrant](https://www.vagrantup.com/)
 - [chef-dk](https://downloads.chef.io/chef-dk/)
 - [vagrant-berkshelf](https://github.com/berkshelf/vagrant-berkshelf)
 - [vagrant-omnibus](https://github.com/chef/vagrant-omnibus)
 - (optional) [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
 
## Installation instructions:

 1. Install Virtualbox (4.x) and latest Vagrant
 2. Install chef-dk
 3. Install vagrant plugins (``` vagrant plugin install <plugin_name> ```): 
  - vagrant-berkshelf
  - vagrant-omnibus
  - vagrant-hostsupdater (optional)
 4. Configure Vagrantfile and roles files.
 5. ``` vagrant up ```