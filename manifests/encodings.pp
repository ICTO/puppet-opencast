define opencast::encoding (
  $encoding = $title,
  $content,
  $type = 'ffmpeg'
) {

  case $type {
    ffmpeg: {
      file {"${opencast::params::configdir}/encoding/${encoding}.properties":
        ensure  => file,
        user    => $opencast::params::user,
        group   => $opencast::params::group,
        mode    => 0644,
        content => $content;
      }
    }
    gstreamer: {
      file {"${opencast::params::configdir}/gsencoding/${encoding}.properties":
        ensure  => file,
        user    => $opencast::params::user,
        group   => $opencast::params::group,
        mode    => 0644,
        content => $content;
      }
    }
    default: { fail("Please specify the encoding type, valid types are ffmpeg or gstreamer")}
  }
}
