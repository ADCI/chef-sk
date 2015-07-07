include_recipe "phing"

# Download VersionControl_Git package from Pear
php_pear "VersionControl_Git" do
  preferred_state "alpha"
  action :install
end