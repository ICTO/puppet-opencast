# == Define: opencast::security
# Define a new opencast security configuration file with
# optional configurion for the ldap connection.
#
# === Parameters:
#
# [*organization_id*]
#   Unique id for the organization_id
#
# [*enable_cas*]
#   Enable CAS authorization in the config file
#
# [*enable_ldap*]
#   Enable LDAP authentication
#
# [*entry_url*]
#   Url to which the users connect to view to site, in case of using
#   a proxy enter this proxy address in place of the actual site url.
#
# [*cas_login_url*]
#   Login url for the CAS server
#
# [*cas_ticket_validator*]
#   Url for the CAS ticket validation
#
# [*cas_logout_url*]
#   CAS logout url
#
# [*cas_key*]
#   Unique cas idenitifier key for this application.
#
# [*ldap_server_url*]
#   LDAP server url
#
# [*ldap_user*]
#   user for ldap server connection
#
# [*ldap_pass*]
#   password for ldap server connection
#
# [*ldap_searchbase*]
#   base path for ldap search
#
# [*ldap_roleattributes*]
#   comma-separated list of attributes that will be mapped to opencast roles
#

define opencast::security (
  $organization_id = $title,
  $enable_cas = false,
  $enable_ldap = false,
  $entry_url = $fqdn,
  $cas_login_url = undef,
  $cas_ticket_validator = undef,
  $cas_logout_url = undef,
  $cas_key = undef,
  $ldap_server_url = undef,
  $ldap_user = undef,
  $ldap_pass = undef,
  $ldap_searchbase = undef,
  $ldap_roleattributes = undef
) {

  $server_url = $::opencast::server_url

  $config_template = $enable_cas ? {
    true    => 'opencast/security/security_sample_cas_xml.erb',
    default => 'opencast/security/mh_default_org.xml.erb'
  }
    
  file{"${opencast::configdir}/security/${organization_id}.xml":
    ensure  => file,
    content => template($config_template),
    owner   => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    require => Package[$opencast::opencast_pkg],
    notify  => Service[matterhorn]
  }

  $ldap_file_ensure = $enable_ldap ? {
    false   => absent,
    default => file
  }

  file{"${opencast::configdir}/factories/org.opencastproject.userdirectory.ldap.properties":
    ensure  => $ldap_file_ensure,
    content => template('opencast/factories/org.opencastproject.userdirectory.ldap.properties.erb'),
    owner   => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    require => Package[$opencast::opencast_pkg],
    notify  => Service[matterhorn];
  }
}
