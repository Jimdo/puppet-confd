# == Class confd::params
#
# This class is meant to be called from confd
# It sets variables according to platform
#
class confd::params {
  $confdir = '/etc/confd'
  $version = 'latest'
  $user = 'root'
  $sitemodule = 'site_confd'
  $install_package = true

  case $::osfamily {
    'Debian': {
      $package_name = 'confd'
      $service_name = 'confd'
      $installdir = '/usr/local/bin'
    }
    'RedHat', 'Amazon': {
      $package_name = 'confd'
      $service_name = 'confd'
      $installdir = '/usr/bin'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
