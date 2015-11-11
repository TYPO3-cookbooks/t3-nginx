t3_nginx_proxy_site "typo3.org" do
  #server_name ['test.typo3.org', 'more.typo3.org']
  #server_name 'typo3.org'
  upstream ['srv107.typo3.org:80']
  # ssl_dhparam
end
