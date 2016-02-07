# PhantomJS
override['phantomjs']['version'] = '2.1.1'
override['phantomjs']['basename'] = "phantomjs-#{node['phantomjs']['version']}-linux-#{node['kernel']['machine']}"

# NodeJS packages
override['nodejs-wrapper']['packages'] = default['nodejs-wrapper']['packages'] += [
    {
        'name' => 'webdriverio',
        'bin_name' => 'wdio',
    },
    {
        'name' => 'mocha',
        'bin_name' => 'mocha',
    }
]