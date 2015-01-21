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
  $opencast_pkg             = 'opencast-matterhorn'
  $opencast_pkg_ensure      = installed
  $profile                  = 'allinone'
  $user                     = 'matterhorn'
  $group                    = 'matterhorn'
  $configdir                = '/opt/matterhorn/etc'
  $server_url               = 'http://localhost:8080'
  $admin_url                = 'http://localhost:8080'
  $engage_url               = 'http://localhost:8080'
  $storage_dir              = '/var/matterhorn'
  $digest_user_name         = 'matterhorn_system_account'
  $digest_user_pass         = 'opencast'
  $enable_demo_admin        = true
  $demo_admin_name          = 'admin'
  $demo_admin_pass          = 'opencast'
  $enable_demo_user         = false
  $streaming_url            = 'rtmp://localhost/matterhorn_engage'
  $download_url             = 'http://localhost:8080/static'
  $solr_search_url          = undef
  $solr_workflow_url        = undef
  $solr_episode_url         = undef
  $solr_series_url          = undef
  $db_vendor                = 'MySQL'
  $db_driver                = 'com.mysql.jdbc.Driver'
  $db_url                   = 'jdbc:mysql://localhost/matterhorn'
  $db_user                  = 'matterhorn'
  $db_pass                  = 'matterhorn'
  $ffmpeg_path              = '/usr/local/bin/ffmpeg'
  $ffprobe_path             = '/usr/local/bin/ffprobe'
  $mediainfo_path           = '/usr/local/bin/mediainfo'
  $tesseract_path           = '/usr/local/bin/tesseract'
  $tesseract_options        = '-l nld+eng -psm 3'
  $gst_launch_path          = '/usr/bin/gst-launch-0.10'
  $sox_path                 = '/usr/local/bin/sox'
  $admin_email              = 'admin@localhost'
  $config_segmenting        = false
  $stabilitythreshold       = '5'
  $changesthreshold         = '0.05'
  $usertracking_enable      = undef
  $max_concurrent           = undef
  $java_opts                = '-Xms2048m -Xmx2048m -XX:MaxPermSize=512m'
  $default_workflow         = 'full'
  $workspace_cleanup_period = '86400'
  $workspace_cleanup_age    = '2592000'
  $flvcompatibility         = 'false'

  #Setup default directories
  $local_storage_dir      = "${storage_dir}/private/${::hostname}"
  $streaming_folder       = 'streams'
  $download_folder        = 'downloads'
  $searchindex_folder     = 'searchindex'
  $seriesindex_folder     = 'seriesindex'
  $schedulerindex_folder  = 'schedulerindex'
  $archive_folder         = 'archive'
  $archivetmp_folder      = 'archive-temp'
  $archiveindex_folder    = 'archiveindex'
  $files_folder           = 'files'
  $workspace_folder       = 'workspace'
  $workflowindex_folder   = 'workflowindex'
}
