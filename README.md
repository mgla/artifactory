# artifactory

## Overview

This is a puppet module that installs Artifactory, a popular Binary repository manager on Debian systems. Currently only tested to Debian Jessie.
Currently, it installs a very specific version of Artifactory and should be seen as a proof of concept.


## Setup

To have Puppet install Artifactory default parameters, declare the artifactory class:

``` puppet
class { 'artifactory': }
```

You need a working installation of Oracle Java 8.
