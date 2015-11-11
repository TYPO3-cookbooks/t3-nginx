require 'spec_helper'

describe 't3-nginx::_config' do

  before do
     stub_command('which nginx').and_return(0)
  end

  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'sets up SSL config' do
      expect { chef_run }.to render_file('/etc/nginx/conf.d/ssl.conf').with_content('ssl_ciphers')
    end
  end
end
