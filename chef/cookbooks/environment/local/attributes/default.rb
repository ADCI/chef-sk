default['vsftpd']['allowed'] = ['vagrant']
default['vsftpd']['chroot'] = ['vagrant']
default['vsftpd']['config']['listen_address'] = '0.0.0.0'

default['nginx-wrapper']['user'] = 'vagrant'

# Default configuration.
default['nginx-wrapper']['sites']['site']['server_name'] = 'site.local'

=begin

Virtual host variables:

server_name - site domain main (by default will be created folder /var/www/<server_name>)
root - path to public files (Drupal core, as example) Default: /var/www/<server_name>/docroot
port - virtual host port Default: 80
index - index file (use carefully) Default: index.php

Example virtual host configuration:

Site with domain "drupal.local" located in directory "/home/drupal" listening port 8080

default['nginx-wrapper']['sites']['site']['server_name'] = 'drupal.local'
default['nginx-wrapper']['sites']['site']['root'] = '/home/drupal'
default['nginx-wrapper']['sites']['site']['port'] = 8080

=end
