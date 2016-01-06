include_recipe "nodejs"

node["nodejs-wrapper"]["packages"].each do |package|
  nodejs_npm package.name

  if package.bin_name
    link "/usr/local/bin/#{package.bin_name}" do
      to "/usr/local/nodejs-#{node['nodejs']['install_method']}-#{node['nodejs']['version']}/bin/#{package.bin_name}"
    end
  end
end