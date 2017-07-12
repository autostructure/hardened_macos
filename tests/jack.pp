#1.1 Verify all Apple provided software is current


#1.2 Enable Auto Update
software_default { '/Library/Preferences/com.apple.SoftwareUpdate':
  ensure => 'present',
  domain => '/Library/Preferences/com.apple.SoftwareUpdate'
  key    => 'AutomaticCheckEnabled',
  type   => 'int',
  value  => '1',
}

#1.3 Enable app update installs


#1.4 Enable system data files and security update installs

#1.5 Enable OS X update installs

#2.1.1 Turn off Bluetooth, if no paired device exists

#2.1.2 Turn off Bluetooth "Discoverable" mode when not pairing devices

#2.1.3 Show Bluetooth status in menu bar

#2.2.1 Enable "Set Time and Date Automatically" (LEVEL 2)

#2.2.2 Ensure time is set within appropriate limits

#2.2.3 Restrict NTP server to loopback interface

#2.3.1 Set an inactivity interval of 20 minutes or less for the screen saver

#2.3.2 Secure screen saver corners (LEVEL 2)

#2.3.3 Verify Display Sleep is set to a value larger than the Screen saver

#2.3.4 Set a screen corner to Start Screen Saver

#2.4.1 Disable Remote Apple Events

#2.4.2 Disable Internet Sharing

#2.4.3 Disable Screen Sharing

#2.4.4 Disable Printer Sharing

#2.4.5 Disable Remote Login

#2.4.6 Disable DVD or CD Sharing

#2.4.7 Disable Bluetooth Sharing

#2.4.8 Disable File Sharing

#2.4.9 Disable Remote Management

#2.5.1 Disable "Wake for Network Access" (LEVEL 2)

#2.5.2 Disable sleeping the computer when connected to power (LEVEL 2)

#2.6.1 Enable FileVault

#2.6.2 Enable Gatekeeper

#2.6.3 Enable Firewall

#2.6.4 Enable Firewall Stealth Mode

#2.6.5 Review Application Firewall Rules

#2.6.6 Enable Location Services (LEVEL 2)

#2.6.7 Monitor Location Services Access (LEVEL 2)

#2.7 iCloud stuff - more a policy than something puppet does (LEVEL 2)

#2.8.1 Time Machine (LEVEL 2)

#2.8.2 Time Machine (LEVEL 2)

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
