define opencast::workflow (
  $workflow = $title,
  $content
) {

  file {"${opencast::params::configdir}/workflows/${workflow}.xml":
    ensure  => file,
    user    => $opencast::params::user,
    group   => $opencast::params::group,
    mode    => 0644,
    content => $content;
  }
}
