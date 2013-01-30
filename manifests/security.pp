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
# [*cas_login_url*]
#   Login url for the CAS server
#
# [*cas_ticket_validator*]
#   Url for the CAS ticket validation
#
# [*cas_logout_url*]
#   CAS logout url
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
  $cas_login_url = undef,
  $cas_ticket_validator = undef,
  $cas_logout_url = undef,
  $ldap_server_url = undef,
  $ldap_user = undef,
  $ldap_pass = undef,
  $ldap_searchbase = undef,
  $ldap_roleattributes = undef
) {

  $server_url = $::opencast::server_url

  if $enable_cas {
    file{"${opencast::configdir}/security/${organization_id}.xml":
      ensure  => file,
      content => template(opencast/security/security_sample_cas_xml.erb),
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => '0644',
      require => Package[$opencast::opencast_pkg],
      notify  => Service[matterhorn]
    }
  } else {
    file{"${opencast::configdir}/security/${organization_id}.xml":
      ensure  => file,
      content => template(opencast/security/mh_default_org.xml.erb),
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => '0644',
      require => Package[$opencast::opencast_pkg],
      notify  => Service[matterhorn]
    }
  }

  if $enable_ldap {
    file{"${opencast::configdir}/factories/org.opencastproject.userdirectory.ldap.properties":
      ensure  => file,
      content => template(opencast/factories/org.opencastproject.userdirectory.ldap.properties.erb),
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => '0644',
      require => Package[$opencast::opencast_pkg],
      notify  => Service[matterhorn];
    }
  }
}
