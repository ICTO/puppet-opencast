# == Class: Opencast::config
#
# Opencast class that does the opencast configuration.
# This class manages the config.properties file that does the general
# opencast matterhorn configuration and the matterhorn.conf file that
# is specific to the package. This file sets the used profile for the
# installation.
#

class opencast::config {

  $server_url           = $::opencast::server_url
  $admin_url            = $::opencast::admin_url
  $engage_url           = $::opencast::engage_url
  $storage_dir          = $::opencast::storage_dir
  $local_storage_dir    = $::opencast::local_storage_dir
  $streaming_dir        = $::opencast::streaming_dir
  $download_dir         = $::opencast::download_dir
  $searchindex_dir      = $::opencast::searchindex_dir
  $seriesindex_dir      = $::opencast::seriesindex_dir
  $schedulerindex_dir   = $::opencast::schedulerindex_dir
  $archive_dir          = $::opencast::archive_dir
  $archiveindex_dir     = $::opencast::archiveindex_dir
  $files_dir            = $::opencast::files_dir
  $workspace_dir        = $::opencast::workspace_dir
  $workflowindex_dir    = $::opencast::workflowindex_dir
  $digest_user_name     = $::opencast::digest_user_name
  $digest_user_pass     = $::opencast::digest_user_pass
  $enable_demo_admin    = $::opencast::enable_demo_admin
  $demo_admin_name      = $::opencast::demo_admin_name
  $demo_admin_pass      = $::opencast::demo_admin_pass
  $enable_demo_user     = $::opencast::enable_demo_user
  $streaming_url        = $::opencast::streaming_url
  $solr_engage_url      = $::opencast::solr_engage_url
  $solr_workflow_url    = $::opencast::solr_workflow_url
  $solr_episode_url     = $::opencast::solr_episode_url
  $db_vendor            = $::opencast::db_vendor
  $db_driver            = $::opencast::db_driver
  $db_url               = $::opencast::db_url
  $db_user              = $::opencast::db_user
  $db_pass              = $::opencast::db_pass
  $ffmpeg_path          = $::opencast::ffmpeg_path
  $mediainfo_path       = $::opencast::mediainfo_path
  $tesseract_path       = $::opencast::tesseract_path
  $gst_launch_path      = $::opencast::gst_launch_path
  $admin_email          = $::opencast::admin_email
  $config_segmenting    = $::opencast::config_segmenting
  $stabilitythreshold   = $::opencast::stabilitythreshold
  $changesthreshold     = $::opencast::changesthreshold
  $usertracking_enable  = $::opencast::usertracking_enable
  $max_concurrent       = $::opencast::max_concurrent

  file {"${opencast::configdir}/config.properties":
    ensure  => present,
    owner   => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    content => template('opencast/config.properties.erb');
  }

  file {"${opencast::configdir}/matterhorn.conf":
    ensure  => present,
    owner   => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    content => template('opencast/matterhorn.conf.erb');
  }

  if $opencast::params::config_segmenting {
    file {"${opencast::configdir}/services/org.opencastproject.analysis.vsegmenter.VideoSegmenter.properties":
      ensure  => file,
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => '0644',
      content => template('opencast/services/org.opencastproject.analysis.vsegmenter.VideoSegmenter.properties.erb');
    }
  }

  if $usertracking_enable != undef {
    file {"${opencast::configdir}/services/org.opencastproject.usertracking.impl.UserTrackingServiceImpl.properties":
      ensure  => file,
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => '0644',
      content => template('opencast/services/org.opencastproject.usertracking.impl.UserTrackingServiceImpl.properties.erb');
    }
  }

  if $max_concurrent != undef {
    file {"${opencast::configdir}/services/org.opencastproject.workflow.impl.WorkflowServiceImpl.properties":
      ensure  => file,
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => '0644',
      content => template('opencast/services/org.opencastproject.workflow.impl.WorkflowServiceImpl.properties.erb');
    }
  }
}
