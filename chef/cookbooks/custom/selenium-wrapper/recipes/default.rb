include_recipe 'selenium::server'

selenium_phantomjs 'selenium_phantomjs' do
  webdriver 'localhost:4444'
  webdriverSeleniumGridHub false
  action :install
end