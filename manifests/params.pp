# == Class: opencast::params
# Configure opencast matterhorn setting
#
# === Parameters:
#
# [*opencast_pkg*]
#   Name of the opencast package found in the internal repository.
#
# [*opencast_profile*]
#   Opencast profile that is used for the installation. Possible values are
#   admin, presentation and worker.
#

class opencast::params {
  $opencast_pkg         = 'opencast-matterhorn'
  $profile              = 'admin'
  $user                 = 'matterhorn'
  $group                = 'matterhorn'
  $configdir            = '/opt/matterhorn/etc'
  $server_url           = 'http://localhost:8080'
  $admin_url            = 'http://localhost:8080'
  $engage_url           = 'http://localhost:8080'
  $storage_dir          = '/var/matterhorn'
  $digest_user_name     = 'matterhorn_system_account'
  $digest_user_pass     = 'opencast'
  $enable_demo_admin    = true
  $demo_admin_name      = 'admin'
  $demo_admin_pass      = 'opencast'
  $enable_demo_user     = false
  $streaming_url        = 'rtmp://localhost/matterhorn_engage'
  $db_vendor            = 'MySQL'
  $db_driver            = 'com.mysql.jdbc.Driver'
  $db_url               = 'jdbc:mysql://localhost/matterhorn'
  $db_user              = 'matterhorn'
  $db_pass              = 'matterhorn'
  $ffmpeg_path          = '/usr/bin/ffmpeg'
  $mediainfo_path       = '/usr/bin/mediainfo'
  $tesseract_path       = '/usr/bin/tesseract'
  $gst_launch_path      = '/usr/bin/gst-launch-0.10'
  $admin_email          = 'admin@localhost'
  $config_segmenting    = false
  $stabilitythreshold   = '5'
  $changesthreshold     = '0.05'
  $usertracking_enable  = undef
  $max_concurrent       = undef
}
