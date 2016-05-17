require 'spec_helper'

describe 's3_wordpress::sql' do
  cached(:chef_run) do
    default_chef_run do |node|

    end
  end

  subject { chef_run }

  before :each do
    stub_command(/.*/).and_return true
    allow(Chef::EncryptedDataBagItem).to receive(:load).and_return(
      'decrypted_aws' => {}
    )
  end
 
  describe "ruby block" do
    it { is_expected.to run_ruby_block('set import_sql') }
  end

  context "when import_sql is true" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['s3_wordpress']['sql']['import_sql'] = true
      end
    end

    describe 's3 files' do
      it { is_expected.to create_aws_s3_file 'sql dump' }
    end

    describe 'bash' do
      it { is_expected.to run_bash 'import sql' }
    end
  end
  
  context "when import_sql is false" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['s3_wordpress']['sql']['import_sql'] = false
      end
    end

    describe 's3 files' do
      it { is_expected.to_not create_aws_s3_file 'sql dump' }
    end

    describe 'bash' do
      it { is_expected.to_not run_bash 'import sql' }
    end
  end
end
