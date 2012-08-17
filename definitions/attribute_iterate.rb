#
# Cookbook Name:: application_nginx
# Definition:: attribute_iterate
#
# Copyright 2012, Stephen Birarda
#

def iterate_attribute_if_exists(resource, attribute, prefix = attribute)
  prefix = attribute
  if @resource.send(attribute).each do |rule|
    puts "#{prefix} #{rule};"
  end
end