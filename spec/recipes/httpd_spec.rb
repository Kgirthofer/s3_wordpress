require 'spec_helper'

describe "s3_wordpress::httpd" do
  ## initialize our run with fauxhai
  cached(:chef_run) do
    default_chef_run do |node|
      node.set['s3_wordpress']['client'] = 'test'
    end
  end
  subject { chef_run }

  before :each do
    stub_command(/.*/).and_return true
  end

  describe "templates" do
    it { is_expected.to create_template('/etc/httpd/conf.d/test.conf') }
  end
end
