template "/var/www/html/#{node['s3_wordpress']['site']}/www/wp-config.php" do
  source 'wp-config.php.erb'
  notifies :restart, 'service[httpd]', :delayed
end

service 'httpd' do
  action :nothing
end

