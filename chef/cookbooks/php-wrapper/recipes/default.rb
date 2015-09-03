node['php']['additional_packages'].each do |package_name|
  package package_name do
    action :install
  end
end

package node['php']['fpm_package'] do
  action :install
end

php_fpm_pool "www" do
  action :install
end

template "php.ini" do
  path "/etc/php5/fpm/php.ini"
  source "php.ini.erb"
  cookbook "php"
  variables(:directives => node['php']['directives'])
  # notifies :restart, "service[#{node['php']['fpm_package']}]"
end