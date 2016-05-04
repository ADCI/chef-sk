include_recipe "php"

php_fpm_pool "default" do
  action :install
  process_manager node['php']['fpm']['process_manager']
  listen node['php']['fpm']['listen']
end

# Create php.ini file for php-fpm bases on php cookbook
template "php.ini" do
  path "/etc/php/7.0/fpm/php.ini"
  source "php.ini.erb"
  cookbook "php"
  variables(:directives => node['php']['directives'])
end

service node['php']['fpm_service'] do
  action :reload
end