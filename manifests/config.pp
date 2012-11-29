# == Class: Opencast::config
#
# Opencast class that does the opencast configuration.
# This class manages the config.properties file that does the general
# opencast matterhorn configuration and the matterhorn.conf file that
# is specific to the package. This file sets the used profile for the
# installation.
#

class opencast::config {

  Class['opencast::params'] -> Class['opencast::config']

  $opencast_profile = $opencast::params::opencast_profile
  $opencast_server_url = $opencast::params::opencast_server_url
  $opencast_admin_url = $opencast::params::opencast_admin_url
  $opencast_engage_url = $opencast::params::opencast_engage_url
  $opencast_storage_dir = $opencast::params::opencast_storage_dir
  $opencast_digest_user_name = $opencast::params::opencast_digest_user_name
  $opencast_digest_user_pass = $opencast::params::opencast_digest_user_pass
  $opencast_enable_demo_user = $opencast::params::opencast_enable_demo_user
  $opencast_streaming_url = $opencast::params::opencast_streaming_url
  $opencast_db_vendor = $opencast::params::opencast_db_vendor
  $opencast_db_driver = $opencast::params::opencast_db_driver
  $opencast_db_url = $opencast::params::opencast_db_url
  $opencast_db_user = $opencast::params::opencast_db_user
  $opencast_db_pass = $opencast::params::opencast_db_pass
  $opencast_ffmpeg_path = $opencast::params::opencast_ffmpeg_path
  $opencast_mediainfo_path = $opencast::params::opencast_mediainfo_path
  $opencast_tesseract_path = $opencast::params::opencast_tesseract_path
  $opencast_gst_launch_path = $opencast::params::opencast_gst_launch_path
  $opencast_admin_email = $opencast::params::opencast_admin_email

  file {"${opencast::params::configdir}/config.properties":
    ensure  => present,
    owner   => $opencast::params::user,
    group   => $opencast::params::group,
    mode    => '0644',
    content => template('opencast/config.properties.erb');
  }

  file {"${opencast::params::configdir}/matterhorn.conf":
    ensure  => present,
    owner   => $opencast::params::user,
    group   => $opencast::params::group,
    mode    => '0644',
    content => template('opencast/matterhorn.conf.erb');
  }
}
