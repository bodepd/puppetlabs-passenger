# Class: passenger
#
# This class installs passenger
#
# Parameters:
#
# Actions:
#   - Install passenger gem
#   - Compile passenger module
#
# Requires:
#   - ruby::dev
#
# Sample Usage:
#
class passenger::ubuntu {
  require ruby::dev

  Class['passenger::ubuntu'] ~> Service['httpd']

  package { ['libapache2-mod-passenger', 'rails', 'librack-ruby']:
    ensure => ensure,
  }

  a2mod { 'headers':
    ensure  => present,
    require => Package['httpd'],
  }

}
