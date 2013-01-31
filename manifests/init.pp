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
class opencast (
  $opencast_pkg         = $opencast::params::opencast_pkg,
  $opencast_pkg_ensure  = $opencast::params::opencast_pkg_ensure,
  $profile              = $opencast::params::profile,
  $user                 = $opencast::params::user,
  $group                = $opencast::params::group,
  $configdir            = $opencast::params::configdir,
  $server_url           = $opencast::params::server_url,
  $admin_url            = $opencast::params::admin_url,
  $engage_url           = $opencast::params::engage_url,
  $storage_dir          = $opencast::params::storage_dir,
  $local_storage_dir    = $opencast::params::local_storage_dir,
  $streaming_dir        = $opencast::params::streaming_dir,
  $download_dir         = $opencast::params::download_dir,
  $searchindex_dir      = $opencast::params::searchindex_dir,
  $seriesindex_dir      = $opencast::params::seriesindex_dir,
  $schedulerindex_dir   = $opencast::params::schedulerindex_dir,
  $archive_dir          = $opencast::params::archive_dir,
  $archiveindex_dir     = $opencast::params::archiveindex_dir,
  $files_dir            = $opencast::params::files_dir,
  $workspace_dir        = $opencast::params::workspace_dir,
  $workflowindex_dir    = $opencast::params::workflowindex_dir,
  $digest_user_name     = $opencast::params::digest_user_name,
  $digest_user_pass     = $opencast::params::digest_user_pass,
  $enable_demo_admin    = $opencast::params::enable_admin_user,
  $enable_demo_user     = $opencast::params::enable_demo_user,
  $streaming_url        = $opencast::params::streaming_url,
  $db_vendor            = $opencast::params::db_vendor,
  $db_driver            = $opencast::params::db_driver,
  $db_url               = $opencast::params::db_url,
  $db_user              = $opencast::params::db_user,
  $db_pass              = $opencast::params::db_pass,
  $ffmpeg_path          = $opencast::params::ffmpeg_path,
  $mediainfo_path       = $opencast::params::mediainfo_path,
  $tesseract_path       = $opencast::params::tesseract_path,
  $gst_launch_path      = $opencast::params::gst_launch_path,
  $admin_email          = $opencast::params::admin_email,
  $config_segmenting    = $opencast::params::config_segmenting,
  $stabilitythreshold   = $opencast::params::stabilitythreshold,
  $changesthreshold     = $opencast::params::changesthreshold,
  $usertracking_enable  = $opencast::params::usertracking_enable,
  $max_concurrent       = $opencast::params::max_concurrent
) inherits opencast::params {

  class{'opencast::install':;} ~>
  class{'opencast::config':;} ~>
  class{'opencast::service':;}
}
