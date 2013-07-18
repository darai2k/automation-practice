#
# Cookbook Name:: sinatra-app
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::system"

rbenv_ruby node[:rbenv][:versions]
rbenv_global node[:rbenv][:versions]

rbenv_gem "sinatra"

directory "/var/sinatra" do
  owner "root"
  group "root"
  mode 0755
end

template "/var/sinatra/config.ru" do
  owner "root"
  group "root"
  mode 0644
end

template "/var/sinatra/app.rb" do
  owner "root"
  group "root"
  mode 0644
end

execute "pkill rackup" do
  only_if "pgrep rackup"
  command "pkill -KILL rackup"
end

rbenv_script "run sinatra" do
  cwd "/var/sinatra"
  code "rackup -D config.ru -p 80"
end
