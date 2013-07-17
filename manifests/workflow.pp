define opencast::workflow (
  $content,
  $workflow = $title
) {

  file {"${opencast::configdir}/workflows/${workflow}.xml":
    ensure  => file,
    user    => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    content => $content;
  }
}
