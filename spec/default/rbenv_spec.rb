require 'spec_helper'

describe file('/usr/local/rbenv') do
  it { should be_directory }
end

describe file('/etc/profile.d/rbenv.sh') do
  it { should be_file }
end

describe command('RBENV_ROOT="/usr/local/rbenv" rbenv version') do
  let(:path) { '/usr/local/rbenv/shims:/usr/local/rbenv/bin' }
  it { should return_stdout(/2.0.0-p247/) }
end
