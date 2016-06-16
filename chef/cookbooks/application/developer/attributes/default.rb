# NodeJS
default['nodejs']['install_method'] = 'binary'
default['nodejs']['binary']['checksum'] = '656d8bff06cc5e108b83176f81de7e1eb16392ae0958ec4a7bca2a3a309333a1'
default['nodejs']['version'] = '4.2.6'

default['nodejs-wrapper']['packages'] = [
    {
        'name' => 'npm',
        'bin_name' => 'npm',
    }
]