#1.1 Verify all Apple provided software is current

#1.2 Enable Auto Update

#1.3 Enable app update installs
software_default { 'AutoUpdate':
  ensure => present,
  domain => '/Library/Preferences/com.apple.commerce',
  key    => 'AutoUpdate',
  type   => 'bool',
  value  => true,
}

#1.4 Enable system data files and security update installs
software_default { 'ConfigDataInstall':
  ensure => present,
  domain => '/Library/Preferences/com.apple.SofrwareUpdate',
  key    => 'ConfigDataInstall',
  type   => 'bool',
  value  => true,
}

#MIGHT NEED '&&' DEPENDENCY TO ABOVE COMMAND, so let's try 'require'
software_default {'CriticalUpdateInstall':
  ensure  => present,
  domain  => '/Library/Preferences/com.apple.SoftwareUpdate',
  key     => 'CriticalUpdateInstall',
  type    => 'bool',
  value   => true,
  require => Software_default['ConfigDataInstall'],
}

#1.5 Enable OS X update installs
software_default {'AutoUpdateRestartRequired':
  ensure => present,
  domain => '/Library/Preferences/com.apple.commerce',
  key    => 'AutoUpdateRestartRequired',
  type   => 'bool',
  value  => true,
}


#2.1.1 Turn off Bluetooth, if no paired device exists
software_default {'ControllerPowerState':
  ensure => present,
  domain => '/Library/Preferences/com.apple.Bluetooth',
  key    => 'ControllerPowerState',
  type   => 'int',
  value  => '0',
}
#TODO: after turning off ControllerPowerState, run sudo killall -HUP blued

#2.1.2 Turn off Bluetooth "Discoverable" mode when not pairing devices
#off by default when bluetooth is off

#2.1.3 Show Bluetooth status in menu bar
#This one is weird... mTwoight need to add a different type
software_default {'menuExtras':
  ensure => present,
  domain => 'com.apple.systemuiserver',
  key    => 'menuExtras',
  type   => 'array-add',
  value  => '/System/Library/CoreServices/Menu Extras/Bluetooth.menu',
}

#2.2.1 Enable "Set Time and Date Automatically" (LEVEL 2)

#2.2.2 Ensure time is set within appropriate limits
#uses systemsetup command

#2.2.3 Restrict NTP server to loopback interface
#need to manage a file

#2.3.1 Set an inactivity interval of 20 minutes or less for the screen saver
#weird flags and audit

#2.3.2 Secure screen saver corners (LEVEL 2)

#2.3.3 Verify Display Sleep is set to a value larger than the Screen saver
#uses pmset command

#2.3.4 Set a screen corner to Start Screen Saver
software_default { 'wvous-tr-corner':
  ensure => present,
  domain => '~/Library/Preferences/com.apple.dock',
  key    => 'wvous-tr-corner',
  type   => 'int',
  value  => '5',
}

#2.4.1 Disable Remote Apple Events
#uses systemsetup command

#2.4.2 Disable Internet Sharing
#uses gui

#2.4.3 Disable Screen Sharing
#uses gui

#2.4.4 Disable Printer Sharing
#uses gui

#2.4.5 Disable Remote Login
#uses systemsetup command

#2.4.6 Disable DVD or CD Sharing
#uses gui

#2.4.7 Disable Bluetooth Sharing
#uses gui

#2.4.8 Disable File Sharing
#uses launchctl command

#2.4.9 Disable Remote Management
#uses gui

#2.5.1 Disable "Wake for Network Access" (LEVEL 2)

#2.5.2 Disable sleeping the computer when connected to power (LEVEL 2)

#2.6.1 Enable FileVault
#uses gui

#2.6.2 Enable Gatekeeper
#uses spctl command

#2.6.3 Enable Firewall
software_default { 'globalstate':
  ensure => present,
  domain => '/Library/Preferences/com.apple.alf',
  key    => 'globalstate',
  type   => 'int',
  value  => '2', #1 or 2
}
#2.6.4 Enable Firewall Stealth Mode
#socketfilersomething command

#2.6.5 Review Application Firewall Rules
#uses gui

#2.6.6 Enable Location Services (LEVEL 2)

#2.6.7 Monitor Location Services Access (LEVEL 2)

#2.7 iCloud stuff - more a policy than something puppet does (LEVEL 2)

#2.8.1 Time Machine (LEVEL 2)

#2.8.2 Time Machine
#no command line remediation

#2.9 Pair the Infrared Receiver if enabled, not really a puppet thing

#2.10 Enable Secure Keyboard Entry in Terminal

#2.11 Java 6 is not the default Java runtime (LEVEL 2)

#2.12 Securely delete files as needed (LEVEL 2), no






software_default { 'LastAttemptBuildVersion':
  ensure => 'present',
  domain => '/Library/Preferences/com.apple.SoftwareUpdate',
  key    => 'LastAttemptBuildVersion',
  #value  => 1,
}
