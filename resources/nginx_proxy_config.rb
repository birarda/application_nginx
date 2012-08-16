#
# Cookbook Name:: acre
# Resource:: nginx_proxy_config
#
# Copyright 2012, Stephen Birarda
#

include Chef::Resource::ApplicationBase

attribute :listen, :kind_of => [Array], :default => [80]
attribute :server_name, :kind_of => [String, Array], :default => node['fqdn']
attribute :client_max_body_size, :kind_of => String, :default => "4G"
attribute :keepalive_timeout, :kind_of => Integer, :default => 5
attribute :ssl_enabled, :kind_of => [TrueClass, FalseClass], :default => false
attribute :public_path, :kind_of => String
attribute :access_log_format, :kind_of => String,  :default => "default"
attribute :proxy_port, :kind_of => Integer, :default => 8000