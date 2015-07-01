#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2015, ADCI
#
# All rights reserved - Do Not Redistribute
#

require 'fileutils'


# Create directory /var/www.
Dir.mkdir("/var/www") unless File.exists?("/var/www")
FileUtils.chown(ENV['SSH_USER'], ENV['SSH_USER'], "/var/www")

# Delete old config files.
Dir.glob("/etc/nginx/sites-enabled/*.conf").each { |file| File.delete(file) }
Dir.glob("/etc/nginx/sites-available/*.conf").each { |file| File.delete(file) }

# nginx.site.conf templates
if node.has_key?("phpapp") && node["phpapp"].has_key?("sites")
  node["phpapp"]["sites"].each do |name, site|

    Dir.mkdir("/var/www/#{site['name']}") unless File.exists?("/var/www/#{site['name']}")
    Dir.mkdir("/var/www/#{site['name']}/project") unless File.exists?("/var/www/#{site['name']}/project")

    template "/etc/nginx/sites-available/#{site['name']}.conf" do
      source "nginx.site.conf.erb"
      mode "0640"
      owner "root"
      group "root"
      variables(:site => site)
    end

    nginx_site "#{site['name']}.conf" do
      :enable
    end
  end
end
