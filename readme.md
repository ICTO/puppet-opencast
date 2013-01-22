# puppet-opencast

This is the opencast matterhorn module for installing and configuring opencast matterhorn.

## Use

```
class {'opencast':
    opencast_pkg => 'opencast-matterhorn',
    profile      => 'admin',
    server_url   => 'http://opencast.org',
    admin_url    => 'http://admin.opencast.org',
    engage_url   => 'http://engage.opencast.org',
    db_url       => 'jdbc:mysql://localhost/opencast',
    db_user      => 'opencast',
    db_pass      => 'opencast',
    storage_dir  => '/var/opencast';
}
```

For more parameters and their defaults have a look at the params.pp class .

### Workflows

```
opencast::workflow { 'encode-archive':
    content => $content;
}
```

### Encodings

Type can be ffmpeg or gstreamer.

```
opencast::encoding {'h264-high':
    content => $content,
    $type   => 'ffmpeg';
}
```

### Organization

Add an organization to the installation, a default organization is always added
upon installation. This is only needed for extra organizations.

```
opencast::organization { 'organization2':
    organization_name   => 'organization2',
    organization_server => 'org2.opencast.org',
    organization_port   => '8080',
    organization_enable_episode => 'true',
    organization_download_link = > 'true';
}
```

for more parameters and their defaults look at organization.pp .

## Requirements

You have to have a packaged version of opencast matterhorn in your local
repository. This has to be an adapted version with the profile changes as 
described on the entwine blog. We use an adapted version of those scripts
for use on Debian. See https://github.com/ICTO/opencast-ugent.git for more
info on these adaptations.
