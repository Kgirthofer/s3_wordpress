# s3_wordpress-cookbook

Pulls a sql dump and a tar.gz file from s3 (containing your /var/www/ files and database dump), installs a lamp server, installs wordpress and copies all the information, configures your .conf file for apache and restarts needed services. Basically, just dump your www and sql files in s3, run the cookbook, and you'll have a fully migrated/functional wordpress site. Also works for installing multiple wordpress sites along side each other on a single server.

## Supported Platforms

Amazon Linux - Will be adding more in time

## Attributes
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['s3_wordpress']['s3']['archive']</tt></td>
    <td>String</td>
    <td>tar.gz file name from s3.</td>
    <td><tt>www.tar.gz</tt></td>
  <tr>
    <td><tt>['s3_wordpress']['www']['install_files']</tt></td>
    <td>Boolean</td>
    <td>bool to pull new files from s3.</td>
    <td><tt>true</tt></td>
  </tr>
    <td><tt>['s3_wordpress']['site']</tt></td>
    <td>String</td>
    <td>name of s3_wordpress site (also names directories).</td>
    <td><tt>test</tt></td>
    <td><tt>['s3_wordpress']['s3']['bucket']</tt></td>
    <td>String</td>
    <td>name of base s3 bucket.</td>
    <td><tt>will error. CHANGE REQUIRED</tt></td>
    <td><tt>['s3_wordpress']['s3']['local_www_file']</tt></td>
    <td>String</td>
    <td>local file location.</td>
    <td><tt>s to /var/www/html/$site/$archive</tt></td>
    <td><tt>['s3_wordpress']['sql']['import_sql']</tt></td>
    <td>Boolean</td>
    <td>bool to import new sql dump from s3.</td>
    <td><tt>true</tt></td>
    <td><tt>['s3_wordpress']['sql']['database']</tt></td>
    <td>Stromg</td>
    <td>name of database in mysql.</td>
    <td><tt>test</tt></td>
    <td><tt>['s3_wordpress']['sql']['database_file']</tt></td>
    <td>String</td>
    <td>name of database file.</td>
    <td><tt>test.sql</tt></td>
    <td><tt>['s3_wordpress']['sql']['database_host']</tt></td>
    <td>String</td>
    <td>name of database host (for wp-config.php).</td>
    <td><tt>localhost</tt></td>
    <td><tt>['s3_wordpress']['vhost']['server_admin']</tt></td>
    <td>String</td>
    <td>name of server admin for vhost.</td>
    <td><tt>root@localhost</tt></td>
    <td><tt>['s3_wordpress']['vhost']['server_name']</tt></td>
    <td>String</td>
    <td>apache server name.</td>
    <td><tt>test.com</tt></td>
    <td><tt>['s3_wordpress']['vhost']['server_alias']</tt></td>
    <td>String</td>
    <td>apache server alias.</td>
    <td><tt>www.test.com</tt></td>
  </tr>
</table>

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
