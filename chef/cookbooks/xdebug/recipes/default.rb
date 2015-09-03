package 'php5-xdebug' do
  action :install
end

template node['xdebug']['config_path'] do
  source 'xdebug.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  # notifies :restart, "service[#{node['php']['fpm_service']}]", :delayed
end