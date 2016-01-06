# Include application cookbooks
include_recipe 'common'
include_recipe 'webserver'
include_recipe 'developer'
#include_recipe 'testing'

# Include local-only cookbooks
include_recipe 'vsftpd'
