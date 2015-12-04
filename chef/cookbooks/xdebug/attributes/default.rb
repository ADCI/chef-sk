default['xdebug']['service_name'] = 'php-fpm'
default['xdebug']['config_path'] = "#{node['php-fpm']['conf_dir']}/20-xdebug.ini"
default['xdebug']['directives'] = {
    'max_nesting_level' => 256,
    'remote_enable' => 1,
    'remote_connect_back' => 1,
}
