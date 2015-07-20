#
# Cookbook Name:: nginx-wrapper
# Recipe:: default
#
# Copyright 2015, ADCI
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

# Add Vagrant user to www-data group
group node['nginx']['group'] do
  action :modify
  members 'vagrant'
  append true
end

# Create directory /var/www.
directory '/var/www' do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0775'
  action :create
end

# Delete /var/www/html @TODO who create?
if node['nginx-wrapper']['delete_default_dir']
  directory '/var/www/html' do
    action :delete
  end
end

# Delete old config files.
Dir.glob('/etc/nginx/sites-enabled/*.conf').each do |file|
  file file do
    action :delete
  end
end
Dir.glob('/etc/nginx/sites-available/*.conf').each do |file|
  file file do
    action :delete
  end
end

# nginx.site.conf templates
if node.has_key?("nginx-wrapper") && node["nginx-wrapper"].has_key?("sites")
  node["nginx-wrapper"]["sites"].each do |key, site|

    directory "/var/www/#{site['server_name']}" do
      owner node['nginx']['user']
      group node['nginx']['group']
      mode '0775'
      action :create
    end

    template "/etc/nginx/sites-available/#{site['server_name']}.conf" do
      source "nginx.site.conf.erb"
      mode "0644"
      owner "root"
      group "root"
      variables(:site => site)
    end

    nginx_site "#{site['server_name']}.conf" do
      :enable
    end

  end
end
