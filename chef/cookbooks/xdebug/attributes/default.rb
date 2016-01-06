default['xdebug']['config_path'] = "/etc/php5/fpm/conf.d/20-xdebug.ini"
default['xdebug']['directives'] = {
    'max_nesting_level' => 256,
    'remote_enable' => 1,
    'remote_connect_back' => 1,
}
