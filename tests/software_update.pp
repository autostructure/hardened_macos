software_default { 'AutomaticCheckEnabled':
  ensure => 'present',
  domain => '/Library/Preferences/com.apple.SoftwareUpdate',
  key    => 'AutomaticCheckEnabled',
  #value  => 1,
}

software_default { 'LastAttemptBuildVersion':
  ensure => 'present',
  domain => '/Library/Preferences/com.apple.SoftwareUpdate',
  key    => 'LastAttemptBuildVersion',
  #value  => 1,
}
#testpush
