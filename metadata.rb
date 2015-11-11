name             "t3-nginx"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Platform cookbook for nginx"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))

version          "2.0.0"

depends          "nginx", "= 2.7.6"
depends          "apt"
depends          "ssl_certificates"
depends          "logrotate"
