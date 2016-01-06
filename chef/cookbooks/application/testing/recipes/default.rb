# Developer utilities
include_recipe 'developer'

# PhantomJS
include_recipe 'phantomjs'

# Jenkins
include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

# Selenium with PhantomJS driver
include_recipe 'selenium-wrapper'