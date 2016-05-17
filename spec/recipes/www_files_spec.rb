require 'spec_helper'

describe 's3_wordpress::www_files' do
  cached(:chef_run) do
    default_chef_run do |node|
      node.set['s3_wordpress']['client'] = 'test'
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
    it { is_expected.to run_ruby_block('set install_files') }
  end

  describe "directories" do
    it {is_expected.to create_directory('/var/www/html/test')}
  end

  describe "commands" do
    it { expect(subject.execute('chown-var-www')).to do_nothing }
    it { expect(subject.execute('chmod-var-www-dir')).to do_nothing }
    it { expect(subject.execute('chmod-var-www-file')).to do_nothing }
  end

  context "when install_files is true" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['s3_wordpress']['www']['install_files'] = true
      end
    end

    describe 's3 files' do
      it { is_expected.to create_aws_s3_file 'www.tar.gz' }
    end

    describe 'bash' do
      it { is_expected.to run_bash 'extract tar' }
    end
  end
  
  context "when install_files is false" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['s3_wordpress']['www']['install_files'] = false
      end
    end

    describe 's3 files' do
      it { is_expected.to_not create_aws_s3_file 'www.tar.gz' }
    end

    describe 'bash' do
      it { is_expected.to_not run_bash 'extract tar' }
    end
  end
end
