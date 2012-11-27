# == Class: opencast
#
# Opencast Matterhorn module. This module is used to install and manage
# Opencast Matterhorn. It assumes an opencast matterhorn package in your local
# repository, including changes to the startup of matterhorn found in
# opencast-ugent repo. These changes are adaptations to the entwine proposed
# rpm install method, see
# http://entwinemedia.com/2012/rpm-based-matterhorn-deployment/
# for more information.
#
# === Examples
#
#  class { opencast:
#    opencast_profile => 'presentation';
#  }
#
# === Authors
#
# Kristof Keppens <k.keppens@ugent.be>
#
class opencast {

  require opencast::params

  include opencast::install
  include opencast::config
  include opencast::service

  Class['opencast::install'] ->
  Class['opencast::config'] ->
  Class['opencast::service']
}
