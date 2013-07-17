# == Define: opencast::encoding
# Define a new opencast encoding profile
#
# === Parameters:
#
# [*encoding*]
#   title for the encodings file
#
# [*content*]
#   content of the encodings file
#
# [*type*]
#   Define if this is a gstreamer or ffmeg encoding profile
#

define opencast::encoding (
  $content,
  $encoding = $title,
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
