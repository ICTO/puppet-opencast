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
# === Parameters
#
# All parameters have sane defaults to install opencast matterhorn, however to
# suit this module to your system you will likely need to add some parameters.
#
# [*opencast_pkg*]
#   Name of the opencast pkg found in your local repository ( default: opencast-matterhorn )
#
# [*opencast_pkg_ensure*]
#   Ensure parameters to pass to the puppet package module ( default: installed )
#
# [*profile*]
#   Opencast profile to specify in the matterhorn.conf file. The options are:
#     * allinone : 1 server setup will all modules
#     * admin : admin server
#     * admin-ingest : admin server + ingest modules
#     * ingest : separate ingest server + distribute modules
#     * presentation : engage server
#     * presentation-distribute : engage server + distribute modules
#     * worker : worker server
#   The default profile is allinone.
#
# [*user*]
#   User the opencast matterhorn service runs under, is used to set ownership
#   on configfiles. ( default: matterhorn )
#
# [*group*]
#   Group the opencast matterhorn service runs under, is used to set group permissions
#   on configfiles. ( default: matterhorn )
#
# [*configdir*]
#   Location for the opencast matterhorn config files. ( default: /opt/matterhorn/etc )
#
# [*server_url*]
#   Url from which this installation is accessed, enter the proxy url if the service is
#   behind a proxy server. ( default: http://localhost:8080 )
#
# [*admin_url*]
#   Url where the admin server is located ( default: http://localhost:8080 )
#
# [*engage_url*]
#   Url where the engage ui is located ( default: http://localhost:8080 )
#
# [*storage_dir*]
#   Directory where the storage folders are located ( default: /var/matterhorn )
#
# [*local_storage_dir*]
#   Directory for local storage ( not shared between servers) ( defaults to
#   ${storage_dir}/private/${::hostname} )
#
# [*streaming_folder*]
#   Destination folder for streaming files ( default: streams )
#
# [*download_folder*]
#   Destination folder for download files ( default: downloads )
#
# [*searchindex_folder*]
#   Destination folder for searchindex files, only relevant when using the built-in
#   SOLR service ( default: searchindex )
#
# [*seriesindex_folder*]
#   Destination folder for seriesindex files, only relevant when using the built-in
#   SOLR service ( default: seriesindex )
#
# [*schedulerindex_folder*]
#   Destination folder for schedulerindex files, only relevant when using the built-in
#   SOLR service ( default: schedulerindex )
#
# [*archive_folder*]
#   Destination folder for archived mediapackages ( default: archive )
#
# [*archiveindex_folder*]
#   Destination folder for archiveindex files, only relevant when using the built-in
#   SOLR service ( default: archiveindex )
#
# [*files_folder*]
#   Destanation folder for files used during mediaprocessing ( default: files )
#
# [*workspace_folder*]
#   Destination folder for working files ( transcodes etc. ) ( default: workspace )
#
# [*workflowindex_folder*]
#   Destination folder for workflowindex files, only relevant when using the built-in
#   SOLR service ( default: workflowindex )
#
# [*digest_user_name*]
#   Username for the digest user account ( default: matterhorn_system_account )
#
# [*digest_user_pass*]
#   Password for the digest user account ( default: opencast )
#
# [*enable_demo_admin*]
#   Enable the creation of the demo admin account ( default: true )
#
# [*demo_admin_name*]
#   Username for the demo admin user ( default: admin )
#
# [*demo_admin_pass*]
#    Password for the demo admin user ( default: opencast )
#
# [*enable_demo_user*]
#   Enable the creation of a list of demo users ( default: false )
#
# [*streaming_url*]
#   Url for the optional streaming server, set this to undef to disable this
#   feature ( default: rtmp://localhost/matterhorn_engage )
#
# [*download_url*]
#   Url for the download server, this url will server the static files
#   ( default: http://localhost:8080/static )
#
# [*solr_search_url*]
#   Url for the optional solr search server ( default: undef )
#
# [*solr_workflow_url*]
#   Url for the optional solr workflow server ( default: undef )
#
# [*solr_episode_url*]
#   Url for the optional solr episode server ( default: undef )
#
# [*solr_series_url*]
#   Url for the optional solr series server ( default: undef )
#
# [*db_vendor*]
#   This can be any value found at http://wiki.eclipse.org/Using_EclipseLink_JPA_Extensions_%28ELUG%29
#   ( default: MySQL)
#
# [*db_driver*]
#   Database driver to use. ( default: "com.mysql.jdbc.Driver" )
#
# [*db_url*]
#   Url for the database ( default: jdbc:mysql://localhost/matterhorn )
#
# [*db_user*]
#   Database username ( default: matterhorn )
#
# [*db_pass*]
#   Database password for the database user ( default: matterhorn )
#
# [*ffmpeg_path*]
#   Path to the ffmpeg binary ( default: /usr/local/bin/ffmpeg )
#
# [*ffprobe_path*]
#   Path to the ffprobe binary ( default: /usr/local/bin/ffprobe )
#
# [*mediainfo_path*]
#   Path to the mediainfo binary ( default: /usr/local/bin/mediainfo )
#
# [*tesseract_path*]
#   Path to the tesseract binary ( default: /usr/local/bin/tesseract )
#
# [*tesseract_options*]
#   Parameters to pass to tesseract ( default: -l nld+eng -psm 3 )
#
# [*gst_launch_path*]
#   Path to the gst-launch binary ( default: /usr/bin/gst-launch-0.10 )
#
# [*sox_path*]
#   Path to the sox binary ( default: /usr/local/bin/sox )
#
# [*admin_email*]
#   Email adress for the server admin ( default: admin@localhost )
#
# [*config_segmenting*]
#   Sets a custom configuration file to configurate the slide segmentation
#   settings ( default: false )
#
# [*stabilitythreshold*]
#   Segmentation config value, number of identical frames before creating a segment
#   ( default: 5 ) ( in frames, assuming 1 frame per second )
#
# [*changesthreshold*]
#   Segmentation config value, percentage of pixels that may change between 2 slides
#   without considering them different ( default: 0.05 )
#
# {*usertracking_enable*]
#   Enable/Disable detailed usertracking ( default: undef )
#
# [*max_concurrent*]
#   Sets number of concurrent workflows ( default: undef )
#
# [*java_opts*]
#   Custom java opts ( default: -Xms2048m -Xmx2048m -XX:MaxPermSize=512m )
#
# [*default_workflow*]
#   Default workflow for ingested mediapackages ( default: full )
#
# [*workspace_cleanup_period*]
#    The scheduled period to perform a cleanup operation ( default: 86400 )
#
# [*workspace_cleanup_age*]
#   The maximum age a file has to be ( in seconds ) before it's deleted by the
#   cleanup operation ( default: 2592000 )
#
# [*flvcompatibility*]
#   Set the flv compatibity flag, if set to true streaming urls will be formed
#   according to the old syntax ( not including the flv: in front of the filename )
#   ( default: false )
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
# Rudy Gevaert <rudy.gevaert@ugent.be>

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
  $demo_admin_name        = $opencast::params::demo_admin_name,
  $demo_admin_pass        = $opencast::params::demo_admin_pass,
  $enable_demo_user       = $opencast::params::enable_demo_user,
  $streaming_url          = $opencast::params::streaming_url,
  $download_url           = $opencast::params::download_url,
  $solr_search_url        = $opencast::params::solr_search_url,
  $solr_workflow_url      = $opencast::params::solr_workflow_url,
  $solr_episode_url       = $opencast::params::solr_episode_url,
  $solr_series_url        = $opencast::params::solr_series_url,
  $db_vendor              = $opencast::params::db_vendor,
  $db_driver              = $opencast::params::db_driver,
  $db_url                 = $opencast::params::db_url,
  $db_user                = $opencast::params::db_user,
  $db_pass                = $opencast::params::db_pass,
  $ffmpeg_path            = $opencast::params::ffmpeg_path,
  $ffprobe_path           = $opencast::params::ffprobe_path,
  $mediainfo_path         = $opencast::params::mediainfo_path,
  $tesseract_path         = $opencast::params::tesseract_path,
  $tesseract_options      = $opencast::params::tesseract_options,
  $gst_launch_path        = $opencast::params::gst_launch_path,
  $sox_path               = $opencast::params::sox_path,
  $admin_email            = $opencast::params::admin_email,
  $config_segmenting      = $opencast::params::config_segmenting,
  $stabilitythreshold     = $opencast::params::stabilitythreshold,
  $changesthreshold       = $opencast::params::changesthreshold,
  $usertracking_enable    = $opencast::params::usertracking_enable,
  $max_concurrent         = $opencast::params::max_concurrent,
  $java_opts              = $opencast::params::java_opts,
  $default_workflow         = $opencast::params::default_workflow,
  $workspace_cleanup_period = $opencast::params::workspace_cleanup_period,
  $workspace_cleanup_age    = $opencast::params::workspace_cleanup_age,
  $flvcompatibility         = $opencast::params::flvcompatibility
) inherits opencast::params {

  $streaming_dir      = "${::opencast::storage_dir}/${::opencast::streaming_folder}"
  $download_dir       = "${::opencast::storage_dir}/${::opencast::download_folder}"
  $searchindex_dir    = "${::opencast::local_storage_dir}/${::opencast::searchindex_folder}"
  $seriesindex_dir    = "${::opencast::local_storage_dir}/${::opencast::seriesindex_folder}"
  $schedulerindex_dir = "${::opencast::local_storage_dir}/${::opencast::schedulerindex_folder}"
  $archive_dir        = "${::opencast::storage_dir}/${::opencast::archive_folder}"
  $archiveindex_dir   = "${::opencast::local_storage_dir}/${::opencast::archiveindex_folder}"
  $files_dir          = "${::opencast::storage_dir}/${::opencast::files_folder}"
  $workspace_dir      = "${::opencast::storage_dir}/${::opencast::workspace_folder}"
  $workflowindex_dir  = "${::opencast::local_storage_dir}/${::opencast::workflowindex_folder}"

  class{'opencast::install':;} ~>
  class{'opencast::config':;} ~>
  class{'opencast::service':;}
}
