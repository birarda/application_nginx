#
# Cookbook Name:: application_nginx
# Resource:: nginx_proxy_config
#
# Copyright 2012, Stephen Birarda
#

include Chef::Resource::ApplicationBase

attribute :template, :kind_of => [String, NilClass], :default => nil
attribute :listen, :kind_of => [Array], :default => [80]
attribute :server_name, :kind_of => [String, Array], :default => node['fqdn']
attribute :client_max_body_size, :kind_of => String, :default => "4G"
attribute :keepalive_timeout, :kind_of => Integer, :default => 5
attribute :ssl_enabled, :kind_of => [TrueClass, FalseClass], :default => false
attribute :public_path, :kind_of => String
attribute :proxy_port, :kind_of => String, :default => ""
attribute :error_page, :kind_of => Array, :default => []
attribute :rewrite, :kind_of => Array, :default => []
attribute :include, :kind_of => Array, :default => []