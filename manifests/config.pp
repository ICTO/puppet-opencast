# == Class: Opencast::config
#
# Opencast class that does the opencast configuration.
# This class manages the config.properties file that does the general
# opencast matterhorn configuration and the matterhorn.conf file that
# is specific to the package. This file sets the used profile for the
# installation.
#

class opencast::config {

  file {"${opencast::configdir}/config.properties":
    ensure  => present,
    owner   => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    content => template('opencast/config.properties.erb');
  }

  file {"${opencast::configdir}/matterhorn.conf":
    ensure  => present,
    owner   => $opencast::user,
    group   => $opencast::group,
    mode    => '0644',
    content => template('opencast/matterhorn.conf.erb');
  }

  if $opencast::params::config_segmenting {
    file {"${opencast::configdir}/services/org.opencastproject.analysis.vsegmenter.VideoSegmenter.properties":
      ensure  => file,
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => 0644,
      content => template('opencast/services/org.opencastproject.analysis.vsegmenter.VideoSegmenter.properties.erb');
    }
  }

  if $usertracking_enable != undef {
    file {"${opencast::configdir}/services/org.opencastproject.usertracking.impl.UserTrackingServiceImpl.properties":
      ensure  => file,
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => 0644,
      content => template('opencast/services/org.opencastproject.usertracking.impl.UserTrackingServiceImpl.properties.erb');
    }
  }

  if $max_concurrent != undef {
    file {"${opencast::configdir}/services/org.opencastproject.workflow.impl.WorkflowServiceImpl.properties":
      ensure  => file,
      owner   => $opencast::user,
      group   => $opencast::group,
      mode    => 0644,
      content => template('opencast/services/org.opencastproject.workflow.impl.WorkflowServiceImpl.properties.erb');
    }
  }
}
