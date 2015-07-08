default['nginx-wrapper']['delete_default_dir'] = TRUE
default['nginx-wrapper']['sites'] = {
    'site' => {
        'server_name' => 'site.local',
        'port' => 80,
    }
}