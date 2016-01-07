require 'spec_helper'

describe package('htop') do
  it { should be_installed }
end

describe package('mc') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end