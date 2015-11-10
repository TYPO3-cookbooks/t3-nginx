def whyrun_supported?
  true
end

action :create do
  name                = new_resource.name
  server_name         = [new_resource.server_name || name].flatten.uniq
  upstream            = [new_resource.upstream].flatten

  nginx_site name do
    template "proxy-site.conf.erb"
    variables(
      :name        => name, 
      :server_name => server_name,
      :upstream    => upstream,
    )
    notifies :reload, 'service[nginx]'
  end

  directory "/var/log/nginx/#{name}" do
    owner node['nginx']['user']
  end

  new_resource.updated_by_last_action true

end

action :delete do
  
  nginx_site new_resource.name do
    enable false
  end

  new_resource.updated_by_last_action true

end

def load_current_resource
  @current_resource = Chef::Resource::T3NginxProxySite.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  # alle attribute laden, um vergleichen zu können...
  # @current_resource.username(@new_resource.name)
  current_resource
end
