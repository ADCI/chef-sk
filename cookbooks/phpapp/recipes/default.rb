#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'fileutils'

include_recipe "nginx"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "php::module_curl"
#include_recipe "php::module_apc"
include_recipe "php::module_gd"
include_recipe "php-fpm"
#include_recipe "mysql_adci"
include_recipe "percona::package_repo"
include_recipe "percona::client"
include_recipe "percona::server"
include_recipe "http_request"
include_recipe "http_request::default"

# Create directory /var/www.
Dir.mkdir("/var/www") unless File.exists?("/var/www")
FileUtils.chown(ENV['SSH_USER'], ENV['SSH_USER'], "/var/www")

# Delete old config files.
Dir.glob("/etc/nginx/sites-enabled/*.conf").each { |file| File.delete(file) }
Dir.glob("/etc/nginx/sites-available/*.conf").each { |file| File.delete(file) }

template "php.ini" do
  path "#{node['php-fpm']['conf_dir']}/php.ini"
  source "php.ini.erb"
  owner "root"
  group "root"
  mode 0644
  variables(:directives => node['php']['directives'])
  notifies :reload, 'service[php-fpm]'
end

template "nginx.conf" do
  path "#{node['nginx']['dir']}/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[nginx]'
end        

# nginx.site.conf templates
if node.has_key?("project") && node["project"].has_key?("sites")
  node["project"]["sites"].each do |site|
    site_name = site[0]
    site_config = site[1]
    site_port = ''
    domain = ''
    flag_www_redirect = false
    ssl = ''
    ssl_certificate = ''
    ssl_certificate_key = ''
    conf_inc = ''
    docroot = "#{node[:doc_root]}/var/www/#{site_name}/project"
    site_config.each do |config|
      case config[0]
        when 'port'
          site_port = config[1]
        when 'domain'
          domain = config[1]
        when 'flag_www_redirect'
          flag_www_redirect = config[1] == true || config[1] == 1 || config[1] == '1' || config[1] == 'true'
        when 'dir'
          docroot = "#{node[:doc_root]}#{config[1]}/project"
        when 'ssl'
          ssl = config[1].downcase
        when 'ssl_certificate'
          ssl_certificate = config[1]
        when 'ssl_certificate_key'
          ssl_certificate_key = config[1]
        when 'conf_inc'
          conf_inc = config[1]
      end
    end
    if site_port == '' && domain == ''
      ::Chef::Log.error("The #{site_name} project doesn't have port or domain option")
      break
    end
    if domain == ''
      domain = site_name;
    end

    template "/etc/nginx/sites-available/#{site_name}.conf" do
      source "nginx.site.conf.erb"
      mode "0640"
      owner "root"
      group "root"
      variables(
                :server_name => site_name,
                :server_port => site_port,
                :domain => domain,
                :flag_www_redirect => flag_www_redirect,
                :ssl => ssl,
                :ssl_certificate => ssl_certificate,
                :ssl_certificate_key => ssl_certificate_key,
                :conf_inc => conf_inc,
                #:server_aliases => ["*.#{site_name}"],
                :docroot => docroot,
                :logdir => "#{node[:nginx][:log_dir]}"
                )
    end

    nginx_site "#{site_name}.conf" do
      :enable
    end
  end
end
