# s3_wordpress-cookbook

Pulls a sql dump and a tar.gz file from s3 (containing your /var/www/ files and database dump), installs a lamp server, installs wordpress and copies all the information, configures your .conf file for apache and restarts needed services. Basically, just dump your www and sql files in s3, run the cookbook, and you'll have a fully migrated/functional wordpress site. Also works for installing multiple wordpress sites along side each other on a single server.

## Supported Platforms

Amazon Linux - Will be adding more in time

## Attributes

default['s3_wordpress']['s3']['archive'] - tar.gz file name from s3. Default www.tar.gz
default['s3_wordpress']['www']['install_files'] - bool to pull new files from s3. Default true
default['s3_wordpress']['site'] - name of s3_wordpress site (also names directories). Default test
default['s3_wordpress']['s3']['bucket'] - name of base s3 bucket. Default will error. CHANGE REQUIRED
default['s3_wordpress']['s3']['local_www_file'] - local file location. Defaults to /var/www/html/$site/$archive
default['s3_wordpress']['sql']['import_sql'] - bool to import new sql dump from s3. Default true
default['s3_wordpress']['sql']['database'] - name of database in mysql. Default test
default['s3_wordpress']['sql']['database_file'] - name of database file. Default test.sql
default['s3_wordpress']['sql']['database_host'] - name of database host (for wp-config.php). Default localhost
default['s3_wordpress']['vhost']['server_admin'] - name of server admin for vhost. Default root@localhost
default['s3_wordpress']['vhost']['server_name'] - apache server name. Default test.com
default['s3_wordpress']['vhost']['server_alias'] - apache server alias. Default www.test.com

## Usage

### s3_wordpress::default

Include `s3_wordpress` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[s3_wordpress::default]"
  ]
}
```

## License and Authors

Author:: Karl Girthofer (karlgirthofer@gmail.com)
License:: GPLv3
