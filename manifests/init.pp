# Class: mac_csi_secure
# ===========================
#
# Full description of class mac_csi_secure here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'mac_csi_secure':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class hardened_macos {
  #1.2 Enable AutoUpdate
  software_default { 'AutomaticCheckEnabled':
    ensure => present,
    domain => '/Library/Preferences/com.apple.SoftwareUpdate',
    key    => 'AutomaticCheckEnabled',
    type   => 'int',
    value  => '1',
  }

  #1.3 Enable app update installs
  software_default { 'AutoUpdate':
    ensure => present,
    domain => '/Library/Preferences/com.apple.commerce',
    key    => 'AutoUpdate',
    type   => 'bool',
    value  => true,
  }

  #1.5 Enable OS X update installs
  software_default { 'AutoUpdateRestartRequired':
    ensure => present,
    domain => '/Library/Preferences/com.apple.commerce',
    key    => 'AutoUpdateRestartRequired',
    type   => 'bool',
    value  => true,
  }

  #2.1.1 Turn off Bluetooth, if no paired device exists
  software_default { 'ControllerPowerState':
    ensure => present,
    domain => '/Library/Preferences/com.apple.Bluetooth',
    key    => 'ControllerPowerState',
    type   => 'int',
    value  => '0',
  }

  #2.3.4 Set a screen corner to Start Screen Saver
  software_default { 'wvous-tr-corner':
    ensure => present,
    domain => '~/Library/Preferences/com.apple.dock',
    key    => 'wvous-tr-corner',
    type   => 'int',
    value  => '5',
  }

  #2.6.3 Enable Firewall
  software_default { 'globalstate':
    ensure => present,
    domain => '/Library/Preferences/com.apple.alf',
    key    => 'globalstate',
    type   => 'int',
    value  => '2', #1 or 2
  }
}
