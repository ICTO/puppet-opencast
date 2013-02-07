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
  $opencast_pkg           = $opencast::params::opencast_pkg,
  $opencast_pkg_ensure    = $opencast::params::opencast_pkg_ensure,
  $profile                = $opencast::params::profile,
  $user                   = $opencast::params::user,
  $group                  = $opencast::params::group,
  $configdir              = $opencast::params::configdir,
  $server_url             = $opencast::params::server_url,
  $admin_url              = $opencast::params::admin_url,
  $engage_url             = $opencast::params::engage_url,
  $storage_dir            = $opencast::params::storage_dir,
  $local_storage_dir      = $opencast::params::local_storage_dir,
  $streaming_folder       = $opencast::params::streaming_folder,
  $download_folder        = $opencast::params::download_folder,
  $searchindex_folder     = $opencast::params::searchindex_folder,
  $seriesindex_folder     = $opencast::params::seriesindex_folder,
  $schedulerindex_folder  = $opencast::params::schedulerindex_folder,
  $archive_folder         = $opencast::params::archive_folder,
  $archiveindex_folder    = $opencast::params::archiveindex_folder,
  $files_folder           = $opencast::params::files_folder,
  $workspace_folder       = $opencast::params::workspace_folder,
  $workflowindex_folder   = $opencast::params::workflowindex_folder,
  $digest_user_name       = $opencast::params::digest_user_name,
  $digest_user_pass       = $opencast::params::digest_user_pass,
  $enable_demo_admin      = $opencast::params::enable_admin_user,
  $enable_demo_user       = $opencast::params::enable_demo_user,
  $streaming_url          = $opencast::params::streaming_url,
  $db_vendor              = $opencast::params::db_vendor,
  $db_driver              = $opencast::params::db_driver,
  $db_url                 = $opencast::params::db_url,
  $db_user                = $opencast::params::db_user,
  $db_pass                = $opencast::params::db_pass,
  $ffmpeg_path            = $opencast::params::ffmpeg_path,
  $mediainfo_path         = $opencast::params::mediainfo_path,
  $tesseract_path         = $opencast::params::tesseract_path,
  $gst_launch_path        = $opencast::params::gst_launch_path,
  $admin_email            = $opencast::params::admin_email,
  $config_segmenting      = $opencast::params::config_segmenting,
  $stabilitythreshold     = $opencast::params::stabilitythreshold,
  $changesthreshold       = $opencast::params::changesthreshold,
  $usertracking_enable    = $opencast::params::usertracking_enable,
  $max_concurrent         = $opencast::params::max_concurrent
) inherits opencast::params {

  $streaming_dir      = "${::opencast::storage_dir}/${::opencast::streaming_folder}"
  $download_dir       = "${::opencast::storage_dir}/${::opencast::download_folder}"
  $searchindex_dir    = "${::opencast::storage_dir}/${::opencast::searchindex_folder}"
  $seriesindex_dir    = "${::opencast::storage_dir}/${::opencast::seriesindex_folder}"
  $schedulerindex_dir = "${::opencast::storage_dir}/${::opencast::schedulerindex_folder}"
  $archive_dir        = "${::opencast::storage_dir}/${::opencast::archive_folder}"
  $archiveindex_dir   = "${::opencast::storage_dir}/${::opencast::archiveindex_folder}"
  $files_dir          = "${::opencast::storage_dir}/${::opencast::files_folder}"
  $workspace_dir      = "${::opencast::storage_dir}/${::opencast::workspace_folder}"
  $workflowindex_dir  = "${::opencast::storage_dir}/${::opencast::workflowindex_folder}"

  class{'opencast::install':;} ~>
  class{'opencast::config':;} ~>
  class{'opencast::service':;}
}
