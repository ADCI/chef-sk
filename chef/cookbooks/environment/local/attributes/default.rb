default['vsftpd']['allowed'] = ['vagrant']
default['vsftpd']['chroot'] = ['vagrant']
default['vsftpd']['config']['listen_address'] = '0.0.0.0'

default['nginx-wrapper']['user'] = 'vagrant'
default['nginx-wrapper']['sites']['site']['server_name'] = 'site.local'