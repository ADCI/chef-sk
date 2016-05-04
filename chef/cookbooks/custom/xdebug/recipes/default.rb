package 'php-xdebug' do
  action :install
end

template node['xdebug']['config_path'] do
  source 'xdebug.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources("service[#{node['php']['fpm_service']}]"), :delayed
end

file "#{node['php']['conf_dir']}/conf.d/20-xdebug.ini" do
  action :delete
end