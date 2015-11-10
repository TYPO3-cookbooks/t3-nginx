actions        :create, :delete
default_action :create

attribute :name,                :kind_of => String,          :required => true, :name_attribute => true
attribute :server_name,         :kind_of => [String, Array]
attribute :upstream,            :kind_of => [String, Array], :required => true
attribute :ssl_certificate,     :kind_of => String
attribute :ssl_certificate_key, :kind_of => String
attribute :ssl_dhparam,         :kind_of => String