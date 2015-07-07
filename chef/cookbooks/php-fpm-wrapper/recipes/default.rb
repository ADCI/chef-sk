include_recipe "php-fpm"

# Create php.ini file for php-fpm bases on php cookbook
template "php.ini" do
  path "#{node['php-fpm']['conf_dir']}/php.ini"
  source "php.ini.erb"
  cookbook "php"
  variables(:directives => node['php']['directives'])
  notifies :reload, 'service[php-fpm]'
end