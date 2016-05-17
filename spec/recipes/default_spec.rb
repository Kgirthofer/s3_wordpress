require 'spec_helper'
## see https://github.com/sethvargo/chefspec

# using chef client or another WIN32OLE dependent cookbook?
# require 'radian/chef/win32ole_chefspec_linux.rb'

describe 's3_wordpress::default' do
  cached(:chef_run) { default_chef_run }
  subject { chef_run }

  before :each do
    stub_command(/.*/).and_return true
    # need to stub out a data bag? see .kitchen.yml too.
    allow(Chef::EncryptedDataBagItem).to receive(:load).and_return 'stuff'
  end

  describe 'included recipies' do
    it { is_expected.to include_recipe 'lamp::default' }
    it { is_expected.to include_recipe 's3_wordpress::www_files' }
    it { is_expected.to include_recipe 's3_wordpress::templates' }
    it { is_expected.to include_recipe 's3_wordpress::sql' }
    it { is_expected.to include_recipe 's3_wordpress::httpd' }
  end
end
