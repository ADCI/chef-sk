package 'php5-fpm' do
  action :install
end

template node['xdebug']['config_path'] do
  source 'xdebug.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources("service[#{node['xdebug']['service_name']}]"), :delayed
end