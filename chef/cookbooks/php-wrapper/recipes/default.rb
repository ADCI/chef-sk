include_recipe "php"

node['php']['additional_packages'].each do |package_name|
  package package_name do
    action :install
  end
end

