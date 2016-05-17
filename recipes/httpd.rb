template "/etc/httpd/conf.d/#{node['s3_wordpress']['site']}.conf" do
  source 'vhost.erb'
  variables({
    :ServerAdmin  => node['s3_wordpress']['vhost']['server_admin'],
    :Website      => node['s3_wordpress']['site'],
    :ServerName   => node['s3_wordpress']['vhost']['server_name'],
    :ServerAlias  => node['s3_wordpress']['vhost']['server_alias']
  })
end
