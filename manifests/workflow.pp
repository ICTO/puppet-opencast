# == Define: opencast::workflow
# Define a new opencast workflow profile
#
# === Parameters:
#
# [*workflow*]
#   title for the workflow file
#
# [*content*]
#   content of the workflow file
#

define opencast::workflow (
  $content,
  $workflow = $title,
) {

  file {"${opencast::configdir}/workflows/${workflow}.xml":
    ensure  => file,
    user    => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    content => $content;
  }
}
