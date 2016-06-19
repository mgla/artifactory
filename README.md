# artifactory

## Overview

This is a puppet module that installs Artifactory, a popular Binary repository manager on Debian systems.
Currently, it installs a very specific version of Artifactory and should be seen as a proof of concept.
Only tested on Debian Jessie.

## Setup

To have Puppet install Artifactory default parameters, declare the artifactory class:

``` puppet
class { 'artifactory': }
```

You need a working installation of Oracle Java 8 on your system.
