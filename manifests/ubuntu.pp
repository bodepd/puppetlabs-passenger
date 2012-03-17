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
class passenger {
  include passenger::params
  require ruby::dev
  require apache

  $version=$passenger::params::version

  package { ['libapache2-mod-passenger', 'rails', 'librack-ruby']:
    ensure => $version
  }

  a2mod { 'headers':
    ensure => present,
  }

}
