#
# Cookbook Name:: s3_wordpress
# Recipe:: default
#
# Copyright (C) 2016 Karl Girthofer
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'lamp::default'
include_recipe 's3_wordpress::www_files'
include_recipe 's3_wordpress::templates'
include_recipe 's3_wordpress::sql'
include_recipe 's3_wordpress::httpd'
