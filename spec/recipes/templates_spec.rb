require 'spec_helper'

describe "s3_wordpress::templates" do
  cached(:chef_run) do
    default_chef_run do |node|
      node.set['s3_wordpress']['client'] = 'test'
    end
  end

  subject { default_chef_run }

  before :each do
    stub_command(/.*/).and_return true
  end
  
  describe "templates" do
    it { is_expected.to create_template '/var/www/html/test/www/wp-config.php' }
  end

  describe 'services' do
    it { expect(subject.service('httpd')).to do_nothing }
  end
end

