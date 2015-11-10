nginx_site "backend.typo3.org" do
  template "site.conf.erb"
  variables(
    :server_name => ["backend.typo3.org"],
  )
end