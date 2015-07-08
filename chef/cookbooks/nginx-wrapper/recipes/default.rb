#
# Cookbook Name:: nginx-wrapper
# Recipe:: default
#
# Copyright 2015, ADCI
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

require 'fileutils'

def create_folder(path)
  Dir.mkdir(path) unless File.exists?(path)
  FileUtils.chown(ENV['SSH_USER'], ENV['SSH_USER'], path)
end

# Create directory /var/www.
create_folder('/var/www')

if node['nginx-wrapper']['delete_default_dir'] && File.exist?('/var/www/html')
  FileUtils.rm_r('/var/www/html')
end

# Delete old config files.
Dir.glob('/etc/nginx/sites-enabled/*.conf').each { |file| File.delete(file) }
Dir.glob('/etc/nginx/sites-available/*.conf').each { |file| File.delete(file) }

# nginx.site.conf templates
if node.has_key?("nginx-wrapper") && node["nginx-wrapper"].has_key?("sites")
  node["nginx-wrapper"]["sites"].each do |key, site|

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
