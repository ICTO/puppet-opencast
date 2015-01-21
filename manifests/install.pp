# == Class: opencast::install
#
# Installs the opencast matterhorn package from your repo.
#

class opencast::install {

  package {$::opencast::opencast_pkg:
    ensure => $::opencast::opencast_pkg_ensure;
  }

  if $::opencast::profile == 'worker' or $::opencast::profile == 'allinone' {
    package {
      'opencast-matterhorn-dependencies':
        ensure => installed;
      'hunspell':
        ensure => installed;
      'hunspell-en-us':
        ensure => installed;
      'myspell-nl':
        ensure => installed;
    }
  }
}
