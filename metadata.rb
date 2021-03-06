name 's3_wordpress'
maintainer 'Karl Girthofer'
maintainer_email 'karlgirthofer@gmail.com'
license 'GNU GPL v3'
description 'Installs/Configures wordpress'
long_description 'Installs/Configures wordpress by pulling files from s3 - relies on a lamp installation - lamp cookbook is sufficient' 
version '1.0.0'

## depends on another cookbook, or series of cookbooks?
## depends 'some_cookbook'

depends 'mysql'
depends 'database'
depends 'lamp'
depends 'aws'
#Cookbooks installed by your Berksfile:
depends 'apt', '3.0.0'
depends 'aws', '3.3.2'
depends 'build-essential', '3.2.0'
depends 'chef-sugar', '3.3.0'
depends 'chef_handler', '1.3.0'
depends 'database', '5.1.2'
depends 'lamp', '1.0.4'
depends 'mysql', '6.1.3'
depends 'ohai', '3.0.1'
depends 'openssl', '4.4.0'
depends 'postgresql', '4.0.6'
depends 'rbac', '1.0.3'
depends 'seven_zip', '2.0.0'
depends 'smf', '2.2.8'
depends 'windows', '1.39.2'
depends 'yum', '3.10.0'
depends 'yum-mysql-community', '0.2.0'
