require 'spec_helper'

describe port(80) do
  it { should be_listening }
end

describe file('/var/sinatra/config.ru') do
  it { should be_file }
end

describe file('/var/sinatra/app.rb') do
  it { should be_file }
end

describe service('rackup') do
  it { should be_running }
end
