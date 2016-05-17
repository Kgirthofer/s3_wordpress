default['s3_wordpress']['s3']['archive']           = 'www.tar.gz'
default['s3_wordpress']['www']['install_files']    = true
default['s3_wordpress']['site']                    = 'test'
default['s3_wordpress']['s3']['bucket']            = 'your_bucket_here'
default['s3_wordpress']['s3']['s3_www_file']       = "/#{node['s3_wordpress']['site']}/#{node['s3_wordpress']['s3']['archive']}"
default['s3_wordpress']['s3']['local_www_file']    = "/var/www/html/#{node['s3_wordpress']['site']}/#{node['s3_wordpress']['s3']['archive']}"

default['s3_wordpress']['sql']['import_sql']       = true
default['s3_wordpress']['sql']['database']         = 'test'
default['s3_wordpress']['sql']['database_file']    = 'test.sql'
default['s3_wordpress']['sql']['database_host']    = 'localhost'

default['s3_wordpress']['s3']['local_sql_file']    = "/tmp/#{node['s3_wordpress']['sql']['database_file']}"
default['s3_wordpress']['s3']['s3_sql_file']       = "/#{node['s3_wordpress']['site']}/#{node['s3_wordpress']['sql']['database_file']}"
default['s3_wordpress']['vhost']['server_admin']   = 'root@localhost'
default['s3_wordpress']['vhost']['server_name']    = 'test.com'
default['s3_wordpress']['vhost']['server_alias']   = 'www.test.com'
