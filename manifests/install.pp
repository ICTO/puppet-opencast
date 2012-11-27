# == Class: opencast::install
#
# Installs the opencast matterhorn package from your repo.
#

class opencast::install {

  require opencast::params

  package {$::opencast::params::opencast_pkg:
    ensure => installed;
  }

}
