default['xdebug']['service_name'] = 'php-fpm'
default['xdebug']['config_path'] = "#{node['php-fpm']['conf_dir']}/20-xdebug.ini"
default['xdebug']['directives'] = {
    'remote_autostart' => 1,
    'remote_connect_back' => 1,
    'remote_enable' => 1,
}