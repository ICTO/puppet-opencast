# == Class: opencast::service
#
# Make sure opencast matterhorn service is running or not running.
#

class opencast::service {

  service {'matterhorn':
    ensure => 'running';
  }
}
