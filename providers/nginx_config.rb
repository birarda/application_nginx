#
# Cookbook Name:: application_nginx
# Provider:: nginx_config
#
# Copyright 2012, Stephen Birarda
#

include Chef::Mixin::LanguageIncludeRecipe

action :before_compile do
end

action :before_deploy do

  template "#{node['nginx']['dir']}/sites-available/#{new_resource.application.name}.conf" do
    source   "nginx_site.conf.erb"
    cookbook "application_nginx"
    owner node[:nginx][:user]
    group node[:nginx][:user]
    mode "644"
    variables :resource => new_resource
  end

  if new_resource.ssl_enabled
    # if this is an ssl site then grab the certificate and certificate key from the data bag
    # and create the appropriate files so that nginx can use them
    file "#{node[:nginx][:cert_dir]}/#{new_resource.application.name}.pem" do
      owner new_resource.owner
      group new_resource.group
      mode "0600"
      action :create
      content Chef::EncryptedDataBagItem.load('secure', new_resource.application.name)['ssl_cert']
    end

    file "#{node[:nginx][:cert_dir]}/#{new_resource.application.name}.key" do
      owner new_resource.owner
      group new_resource.group
      mode "0600"
      action :create
      content Chef::EncryptedDataBagItem.load('secure', new_resource.application.name)['ssl_key']
    end
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

