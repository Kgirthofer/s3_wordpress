include_recipe 'aws'

decrypted_aws = Chef::EncryptedDataBagItem.load('aws', node.chef_environment)
sql_pass = Chef::EncryptedDataBagItem.load('mysql', "password")

aws_s3_file 'sql dump' do
  bucket                 node['s3_wordpress']['s3']['bucket']
  path                   node['s3_wordpress']['s3']['local_sql_file']
  remote_path            node['s3_wordpress']['s3']['s3_sql_file']
  aws_access_key_id      "#{decrypted_aws['aws_access_key_id']}"
  aws_secret_access_key  "#{decrypted_aws['aws_secret_access_key']}"
  only_if { node['s3_wordpress']['sql']['import_sql'] }
end

bash 'import sql' do
  cwd "/tmp"
  code <<-EOH
  mysql -u root -p#{sql_pass['mysql_password']} -e "CREATE DATABASE #{node['s3_wordpress']['sql']['database']}"
  mysql -u root -p#{sql_pass['mysql_password']} -e "GRANT ALL PRIVILEGES ON #{node['s3_wordpress']['sql']['database']}.* to '#{node['s3_wordpress']['sql']['database']}'@'#{node['s3_wordpress']['sql']['database_host']}' IDENTIFIED BY '#{sql_pass['mysql_password']}'"
  mysql -u root -p#{sql_pass['mysql_password']} #{node['s3_wordpress']['sql']['database']} < #{node['s3_wordpress']['sql']['database_file']}
  EOH
  only_if { node['s3_wordpress']['sql']['import_sql']  }
end

ruby_block 'set import_sql' do
  block do
    node.set['s3_wordpress']['sql']['import_sql'] = false
    node.save
  end
  action :run
end

