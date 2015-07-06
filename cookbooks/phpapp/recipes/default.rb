#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2015, ADCI
#
# All rights reserved - Do Not Redistribute
#

require 'fileutils'

def create_folder(path)
  Dir.mkdir(path) unless File.exists?(path)
  FileUtils.chown(ENV['SSH_USER'], ENV['SSH_USER'], path)
end

# Download VersionControl_Git package from Pear
php_pear "VersionControl_Git" do
  preferred_state "alpha"
  action :install
end

# Create php.ini file for php-fpm bases on php cookbook
template "php.ini" do
  path "#{node['php-fpm']['conf_dir']}/php.ini"
  source "php.ini.erb"
  cookbook "php"
  variables(:directives => node['php']['directives'])
  notifies :reload, 'service[php-fpm]'
end

# Create directory /var/www.
create_folder('/var/www')

# Delete old config files.
Dir.glob('/etc/nginx/sites-enabled/*.conf').each { |file| File.delete(file) }
Dir.glob('/etc/nginx/sites-available/*.conf').each { |file| File.delete(file) }

# nginx.site.conf templates
if node.has_key?("phpapp") && node["phpapp"].has_key?("sites")
  node["phpapp"]["sites"].each do |key, site|

    create_folder("/var/www/#{site['server_name']}")

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
