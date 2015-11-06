# Chef Server Kit

## Using with Vagrant for local development:

 - [Virtualbox](https://www.virtualbox.org/)
 - [Vagrant](https://www.vagrantup.com/)
 - [chef-dk](https://downloads.chef.io/chef-dk/)
 - [vagrant-berkshelf](https://github.com/berkshelf/vagrant-berkshelf)
 - [vagrant-omnibus](https://github.com/chef/vagrant-omnibus)
 - (optional) [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
 
## Installation instructions:

 1. Install Virtualbox and latest Vagrant
 2. Install chef-dk
 3. Install vagrant plugins (``` vagrant plugin install <plugin_name> ```): 
  - vagrant-berkshelf
  - vagrant-omnibus
  - vagrant-hostsupdater (optional)
 4. Configure Vagrantfile and roles files.
 5. ``` vagrant up ```
 
## Running cookbooks without vagrant:

 1. Install Chef (you can use Debian repository, omnibus installer or any other installer source)
 2. Install chef-dk
 3. Copy repository to your server
 4. Vendor cookbooks from Berksfile to cookbooks folder (``` berks vendor <cookbooks_path> ```)
 5. Create production role (production.rb)
 5. Create solo.rb and solo.json files (you can use examples from "chef" folder)
    Please note: you can use only absolute paths in solo.rb file
 6. Run chef-solo (``` sudo chef-solo -c solo.rb ```)

