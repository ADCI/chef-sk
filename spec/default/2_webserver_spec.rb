require 'spec_helper'

# Nginx
describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# PHP
describe 'PHP packages' do

  context package('php5') do
    it { should be_installed }
  end

  context package('php5-curl') do
    it { should be_installed }
  end

  context package('php5-mysql') do
    it { should be_installed }
  end

  context package('php5-gd') do
    it { should be_installed }
  end

  context package('imagemagick') do
    it { should be_installed }
  end

end

describe 'PHP-FPM socket' do

  context file('/var/run/php5-fpm.sock') do
    it { should exist }
  end

end

# MariaDB (MySQL)
describe 'MySQL packages' do

  context package('mariadb-client-10.0') do
    it { should be_installed }
  end

  context package('mariadb-server-10.0') do
    it { should be_installed }
  end

end

describe service('mysql') do
  it { should be_running }
end

describe 'MySQL config parameters' do

  # Common
  context mysql_config('read-buffer-size') do
    its(:value) { should == to_bytes(2) }
  end

  context mysql_config('read-rnd-buffer-size') do
    its(:value) { should == to_bytes(1) }
  end

  context mysql_config('sort-buffer-size') do
    its(:value) { should == to_bytes(3) }
  end

  context mysql_config('wait-timeout') do
    its(:value) { should == 1800 }
  end

  context mysql_config('max-allowed-packet') do
    its(:value) { should == to_bytes(48) }
  end

  context mysql_config('query-cache-size') do
    its(:value) { should == 0 }
  end

  context mysql_config('query-cache-type') do
    its(:value) { should == 'OFF' }
  end

  context mysql_config('join-buffer-size') do
    its(:value) { should == to_bytes(2) }
  end

  context mysql_config('table-cache') do
    its(:value) { should == 1024 }
  end

  context mysql_config('max-connections') do
    its(:value) { should == 1000 }
  end

  context mysql_config('thread-cache-size') do
    its(:value) { should == 286 }
  end

  context mysql_config('max-connect-errors') do
    its(:value) { should == 1000 }
  end

  # InnoDB
  context mysql_config('innodb-buffer-pool-size') do
    its(:value) { should >= to_bytes(128) }
  end

  context mysql_config('innodb-log-buffer-size') do
    its(:value) { should >= to_bytes(4) }
  end

  context mysql_config('innodb-log-file-size') do
    its(:value) { should >= to_bytes(128) }
  end

  context mysql_config('innodb-file-format') do
    its(:value) { should == 'Barracuda' }
  end

  context mysql_config('innodb-file-per-table') do
    its(:value) { should == 'TRUE' }
  end
end