# == Class: artifactory
#
# TBD
#
# === Parameters
#
# TBD
#
# === Variables
#
# TBD
#
# === Examples
#
# TBD
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
  # Download deb:   http://jfrog.bintray.com/artifactory-debs/pool/main/j/jfrog-artifactory-oss-deb/jfrog-artifactory-oss-4.8.0.deb
  # Require oracle-java
  # Remove broken sysvinit
  file { '/etc/init.d/artifactory':
    ensure => absent,
  }
  file { '/etc/init.d/artifactory':
    ensure => absent,
  }
}
