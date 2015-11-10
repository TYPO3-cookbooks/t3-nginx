require 'spec_helper'

describe 't3-nginx::_test_proxy' do

  before do
     stub_command('which nginx').and_return(0)
   end

  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'creates the test proxy site' do
      expect { chef_run }.to render_file('/etc/nginx/conf.d/sites-enabled/test-proxy.typo3.org.conf')
    end
  end
end
