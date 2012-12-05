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

class opencast::params (
  $opencast_pkg               = 'opencast-matterhorn',
  $opencast_profile           = 'admin',
  $user                       = 'matterhorn',
  $group                      = 'matterhorn',
  $configdir                  = '/opt/matterhorn/etc',
  $opencast_server_url        = 'localhost:8080',
  $opencast_admin_url         = 'localhost:8080',
  $opencast_engage_url        = 'localhost:8080',
  $opencast_storage_dir       = '/var/matterhorn',
  $opencast_digest_user_name  = 'matterhorn_system_account',
  $opencast_digest_user_pass  = 'opencast',
  $opencast_enable_demo_user  = false,
  $opencast_streaming_url     = 'rtmp://localhost/matterhorn_engage',
  $opencast_db_vendor         = 'MySQL',
  $opencast_db_driver         = 'com.mysql.jdbc.Driver',
  $opencast_db_url            = 'jdbc:mysql://localhost/matterhorn',
  $opencast_db_user           = 'matterhorn',
  $opencast_db_pass           = 'matterhorn',
  $opencast_ffmpeg_path       = '/usr/bin/ffmpeg',
  $opencast_mediainfo_path    = '/usr/bin/mediainfo',
  $opencast_tesseract_path    = '/usr/bin/tesseract',
  $opencast_gst_launch_path   = '/usr/bin/gst-launch-0.10',
  $opencast_admin_email       = 'admin@localhost',
  $config_segmenting          = false,
  $stabilitythreshold         = '5',
  $changesthreshold           = '0.05',
  $usertracking_enable        = undef,
  $max_concurrent             = undef
) {

}
