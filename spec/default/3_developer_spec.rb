require 'spec_helper'

describe command('composer -V') do
  its(:stdout) { should match /Composer/ }
end

describe command('drush version') do
  its(:stdout) { should match /Drush Version   :  8./ }
end

describe 'Xdebug' do

  context package('php5-xdebug') do
    it { should be_installed }
  end

  context file('/etc/php5/fpm/conf.d/20-xdebug.ini') do
    it { should exist }
  end

end

describe 'NodeJS and NPM' do

  describe command('node -v') do
    its(:stdout) { should match /v4.2./ }
  end

  describe command('npm -v') do
    its(:stdout) { should match /3./ }
  end

  describe command('gulp -v') do
    its(:stdout) { should match /CLI version 3./ }
  end

end