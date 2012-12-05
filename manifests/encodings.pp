define opencast::encoding (
  $encoding = $title,
  $content
) {

  file {"${opencast::params::configdir}/encoding/${encoding}.properties":
    ensure  => file,
    user    => $opencast::params::user,
    group   => $opencast::params::group,
    mode    => 0644,
    content => $content;
  }
}
