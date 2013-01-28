# == Class: opencast::install
#
# Installs the opencast matterhorn package from your repo.
#

class opencast::install {

  package {$::opencast::opencast_pkg:
    ensure => installed;
  }

  if $::opencast::profile == 'worker' {
    package {
      'ffmpeg':
        ensure => installed;
      'mediainfo':
        ensure => installed;
      'tesseract-ocr':
        ensure => installed;
      'tesseract-ocr-eng':
        ensure => installed;
      'tesseract-ocr-nld':
        ensure => installed;
      'libgstreamer0.10':
        ensure => installed;
    }
  }
}
