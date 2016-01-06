include_recipe "php"

node['php']['additional_packages'].each do |package_name|
  package package_name do
    action :install
  end
end

php_fpm_pool "default" do
  action :install
  process_manager node['php']['fpm']['process_manager']
end

# Create php.ini file for php-fpm bases on php cookbook
template "php.ini" do
  path "/etc/php5/fpm/php.ini"
  source "php.ini.erb"
  cookbook "php"
  variables(:directives => node['php']['directives'])
end

service node['php']['fpm_service'] do
  action :reload
end