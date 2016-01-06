include_recipe "drush"

composer_project node['drush']['install_dir'] do
  dev false
  quiet true
  prefer_dist false
  action :install
end