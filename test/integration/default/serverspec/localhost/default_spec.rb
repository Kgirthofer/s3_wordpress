require 'spec_helper'

## see http://serverspec.org/

#describe directory ('/var/www/html') do
#  it { should be_directory }
#  it { should be_mode 775 }
#  it { should be_owned_by 'apache' }
#  it { should be_grouped_into 'www' }
#end

describe service ('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

describe service ('httpd') do
  it { should be_enabled  }
  it { should be_running  }
end

describe file ('/etc/httpd/conf.d/test.conf') do
  it { should be_file }
  its(:content) { should match /root@localhost/ }
end

describe file ('/var/www/html/test/www/wp-config.php') do
  it { should be_file  }
  it { should be_mode 664 }
end
