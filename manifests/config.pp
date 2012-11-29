# == Class: Opencast::config
#
# Opencast class that does the opencast configuration.
# This class manages the config.properties file that does the general
# opencast matterhorn configuration and the matterhorn.conf file that
# is specific to the package. This file sets the used profile for the
# installation.
#

class opencast::config {

  require opencast::params

  file {"${opencast::configdir}/config.properties":
    ensure => present,
    owner  => $opencast::user,
    group  => $opencast::group,
    mode   => '0755',
    source => 'puppet://modules/opencast/config.properties.erb';
  }

  file {"${opencast::configdir}/matterhorn.conf":
    ensure => present,
    owner  => $opencast::user,
    group  => $opencast::group,
    mode   => '0755',
    source => 'puppet://modules/opencast/matterhorn.conf.erb';
  }
}
