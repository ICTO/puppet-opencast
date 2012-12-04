# == Define: opencast::organization
# Define a new opencast organization
#
# === Parameters:
#
# [*organization_id*]
#   Unique id for the organization
#
# [*organization_name*]
#   Name for the organization
#
# [*organization_server*]
#   server url that will be used for this organization, this is the url without
#   http prefix!
#
# [*organization_port*]
#   Server port for this organization
#
# [*organization_enable_episode*]
#   Enable or disable the Episode tab in the admin interface.
#
# [*organization_enable_users*]
#   Enable or disable the User tab in the admin interface
#
# [*organization_series_prepopulate*]
#   Disable or enable prepopulate series metadata when scheduling a recording
#
# [*organization_download_link*]
#   Enable or disable the download link in the engage interface
#
# [*organization_annotation_enable*]
#   Enable or disable the annotation service in the engage player.
#
# [*organization_media_module_enable*]
#   Enable or disable media module 
#
# [*organization_mobile_redirect*]
#   Enable or disable redirection of mobile users to a different url
#
# [*organization_mobile_redirect_url*]
#   Url to redirect mobile users to
#
# [*organization_mobile_redirect_description*]
#   Description for mobile users before redirection
#
# = Todo:
# Security file is placed with all default rules, this has to be parameterized
# so that everything can be configured.
#

define opencast::organization (
  $organization_id = $title,
  $organization_name = 'Opencast Project',
  $organization_server = 'localhost',
  $organization_port = '8080',
  $organization_enable_episode = 'true',
  $organization_enable_users = 'false',
  $organization_series_prepopulate = 'false',
  $organization_download_link = 'false',
  $organization_annotation_enable = 'true',
  $organization_media_module_enable = 'true',
  $organization_mobile_redirect = 'false',
  $organization_mobile_redirect_url,
  $organization_mobile_redirect_description
) {

  file{"${opencast::params::configdir}/load/org.opencastproject.organization-${organization_id}.cfg":
    ensure  => file,
    content => template("opencast/load/org.opencastproject.organization-mh_default_org.cfg.erb"),
    owner   => $opencast::params::user,
    group   => $opencast::params::group,
    mode    => 0644,
    require => Package[$opencast::params::opencast_pkg],
    notify  => Service[matterhorn]
  }

  file{"${opencast::params::configdir}/security/${organization_id}.xml":
    ensure  => file,
    content => template(opencast/security/mh_default_org.xml.erb),
    owner   => $opencast::params::user,
    group   => $opencast::params::group,
    mode    => 0644,
    require => Package[$opencast::params::opencast_pkg],
    notify  => Service[matterhorn]
  }
}
