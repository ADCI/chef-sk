include_recipe 'nodejs'

bash 'install_webdriverio'  do
  code "su vagrant -l -c 'npm install webdriverio'"
end

bash 'install_mocha'  do
  code "su vagrant -l -c 'npm install mocha'"
end

