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