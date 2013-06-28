define opencast::encoding (
  $encoding = $title,
  $content,
  $type = 'ffmpeg'
) {

  case $type {
    ffmpeg: {
      file {"${opencast::configdir}/encoding/${encoding}.properties":
        ensure  => file,
        user    => $opencast::user,
        group   => $opencast::group,
        mode    => '0644',
        content => $content;
      }
    }
    gstreamer: {
      file {"${opencast::configdir}/gsencoding/${encoding}.properties":
        ensure  => file,
        user    => $opencast::user,
        group   => $opencast::group,
        mode    => '0644',
        content => $content;
      }
    }
    default: { fail('Please specify the encoding type, valid types are ffmpeg or gstreamer')}
  }
}
