include_recipe "nginx::repo"
include_recipe "nginx::package"

include_recipe "#{cookbook_name}::_config_ssl"
include_recipe "#{cookbook_name}::_disable_default"
include_recipe "#{cookbook_name}::_logrotate"

# this recipe starts nginx. we have to deploy our config before.
# imagine the case that we earlier deployed something that prevents nginx
# to start - we can never get out of this without manually fixing it,
# as every chef run will fail prior to fixing the config.
include_recipe "nginx::default"
