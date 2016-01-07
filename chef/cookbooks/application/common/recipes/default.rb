# Update APT cache
include_recipe 'apt'

# Install Git
include_recipe 'git'

# Install common utilities
node['common']['packages'].each do |package_name|
  package package_name do
    action :install
  end
end