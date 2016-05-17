include_recipe 'aws'

decrypted_aws = Chef::EncryptedDataBagItem.load('aws', node.chef_environment)

directory "/var/www/html/#{node['s3_wordpress']['site']}" do
  action :create
  owner  "apache"
  group  "www"
  mode   "2775"
end

aws_s3_file 'www.tar.gz' do
  bucket                 node['s3_wordpress']['s3']['bucket']
  path                   node['s3_wordpress']['s3']['local_www_file']
  remote_path            node['s3_wordpress']['s3']['s3_www_file']
  aws_access_key_id      "#{decrypted_aws['aws_access_key_id']}"
  aws_secret_access_key  "#{decrypted_aws['aws_secret_access_key']}"
  only_if { node['s3_wordpress']['www']['install_files'] }
end

bash 'extract tar' do
  cwd "/var/www/html/#{node['s3_wordpress']['site']}"
  code <<-EOH
  tar -zxvf #{node['s3_wordpress']['s3']['local_www_file']}
  EOH
  only_if { node['s3_wordpress']['www']['install_files']  }
  notifies :run, 'execute[chown-var-www]', :delayed
  notifies :run, 'execute[chmod-var-www-dir]', :delayed
  notifies :run, 'execute[chmod-var-www-file]', :delayed
end

execute 'chown-var-www' do
  command 'chown -R apache:www /var/www'
  action :nothing
end

execute 'chmod-var-www-dir' do
  command 'find /var/www -type d -exec sudo chmod 2775 {} \;'
  action :nothing
end

execute 'chmod-var-www-file' do
  command 'find /var/www -type f -exec sudo chmod 0664 {} \;'
  action :nothing
end

ruby_block 'set install_files' do
  block do
    node.set['s3_wordpress']['www']['install_files'] = false
    node.save
  end
  action :run
end

