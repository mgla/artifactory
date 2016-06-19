# == Class: artifactory
#
# Class to install Artifactory on a Debian system
# Requires oracle-java
# Requires a realizable [Package['grep'], Package['dpkg'], Package['wget']]
#
# === Authors
#
# Maik Glatki <maik.glatki@gmail.com>
#
# === Copyright
#
# Copyright 2016 Maik Glatki
#

class artifactory {
    $download = 'https://jfrog.bintray.com/artifactory-debs/pool/main/j/jfrog-artifactory-oss-deb/jfrog-artifactory-oss-4.8.0.deb'
  # Install official .deb file, if not installed.
  exec { 'artifactory-install':
    command => "/usr/bin/wget '${download}' -O /tmp/arti.deb && /usr/bin/dpkg -i /tmp/arti.deb && rm -f /tmp/arti.deb",
    onlyif  => "/usr/bin/dpkg -s jfrog-artifactory-oss | /bin/egrep -vq '^Status: install ok installed$' || exit 0 && exit 1",
    require => [Package["grep"], Package["dpkg"], Package["wget"]],
  }
  # Remove broken sysvinit
  file { '/etc/init.d/artifactory':
    ensure => absent,
  }
  file { '/etc/systemd/system/artifactory.service':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => 644,
    source => 'puppet:///modules/artifactory/artifactory.service'
  }
  file { '/etc/default/artifactory':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => 644,
    source => 'puppet:///modules/artifactory/artifactory'
  }
  exec { 'artifactory-systemd-daemon-reload':
    command     => '/bin/systemctl daemon-reload',
    subscribe   => File['/etc/systemd/system/artifactory.service'],
    refreshonly => true,
    notify      => Exec['artifactory-systemd-enable'],
  }
  # After artifactory is installed and systemd files are installed, enable systemd service
  exec { 'artifactory-systemd-enable':
    require   => [File['/etc/default/artifactory'], File['/etc/systemd/system/artifactory.service']],
    onlyif    => "/bin/systemctl show artifactory | /bin/egrep -q '^UnitFileState=disabled$'",
    command   => '/bin/systemctl enable artifactory.service',
  }
}
