# == Class: opencast::install
#
# Installs the opencast matterhorn package from your repo.
#

class opencast::install {

  package {$::opencast::opencast_pkg:
    ensure => installed;
  }

}
