#
# Cookbook Name:: acre
# Provider:: nginx_proxy
#
# Copyright 2012, Stephen Birarda
#

include Chef::Mixin::LanguageIncludeRecipe

action :before_compile do
end

action :before_deploy do

  template "#{node['nginx']['dir']}/sites-available/#{new_resource.application.name}.conf" do
    source "nginx_proxy.conf.erb"
    owner node[:nginx][:user]
    group node[:nginx][:user]
    mode "644"
    variables :resource => new_resource
  end

  nginx_site "#{new_resource.application.name}.conf"

end

action :before_migrate do
end

action :before_symlink do
end

action :before_restart do
end

action :after_restart do
end

