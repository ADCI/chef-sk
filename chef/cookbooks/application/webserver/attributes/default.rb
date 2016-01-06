# PHP
default['php']['directives']['error_reporting'] = 'E_ALL'
default['php']['directives']['memory_limit'] = '320M'
default['php']['directives']['max_execution_time'] = '120'
default['php']['directives']['max_input_vars'] = '3000'
default['php']['directives']['post_max_size'] = '100M'
default['php']['directives']['upload_max_filesize'] = '100M'
default['php']['directives']['display_errors'] = 'On'
default['php']['directives']['html_errors'] = 'On'
default['php']['directives']['display_startup_errors'] = 'On'
default['php']['directives']['SMTP'] = 'localhost.localdomain'
default['php']['directives']['sendmail_from'] = 'vagrant@localhost.localdomain'
default['php']['additional_packages'] = %w(php5-curl imagemagick php5-gd php5-mysql)

# Nginx
default['nginx']['default_site_enabled'] = FALSE
default['nginx']['client_max_body_size'] = '64M'

# MariaDB (MySQL)
default['mariadb']['server_root_password'] = 'root'
default['mariadb']['remove_anonymous_users'] = TRUE
default['mariadb']['remove_test_database'] = TRUE

default['mariadb']['mysqld']['join_buffer_size'] = '2M'
default['mariadb']['mysqld']['read_buffer_size'] = '2M'
default['mariadb']['mysqld']['read_rnd_buffer_size'] = '1M'
default['mariadb']['mysqld']['sort_buffer_size'] = '3M'
default['mariadb']['mysqld']['table_cache'] = '1024'
default['mariadb']['mysqld']['thread_cache_size'] = '286'
default['mariadb']['mysqld']['wait_timeout'] = '1800'
default['mariadb']['mysqld']['max_allowed_packet'] = '48M'
default['mariadb']['mysqld']['max_connect_errors'] = '1000'
default['mariadb']['mysqld']['query_cache_size'] = '0'
default['mariadb']['mysqld']['query_cache_type'] = '0'

default['mariadb']['innodb']['buffer_pool_size'] = '128M'
default['mariadb']['innodb']['file_format'] = 'Barracuda'
default['mariadb']['innodb']['file_per_table'] = TRUE
default['mariadb']['innodb']['log_buffer_size'] = '4M'
default['mariadb']['innodb']['log_file_size'] = '128M'