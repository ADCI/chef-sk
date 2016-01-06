# PhantomJS
node.default['phantomjs']['version'] = '1.9.8'

# NodeJS
default['nodejs']['install_method'] = 'binary'
default['nodejs']['binary']['checksum'] = 'dcae0c0faf9841ef38953075e67ca477ef9d2ea7c14ac2221de2429813f83a62'
default['nodejs']['version'] = '4.2.4'

default['nodejs-wrapper']['packages'] = [
    {
        'name' => 'gulp',
        'bin_name' => 'gulp',
    }
]