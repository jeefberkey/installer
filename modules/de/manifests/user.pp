# == Class: de::user
#
# Sets up user and group
#
class de::user {
  user { $::de::user:
    ensure   => present,
    comment  => "$::de::fullname",
    home     => "/home/$::de::user",
    shell    => '/bin/zsh',
    require  => Package['zsh']
  }

  group { $::de::group: }
  file { "/home/$::de::user":
    ensure => directory,
    owner => $::de::user,
    group => $::de::group,
    managehome => true,
    require => Group[$::de::group]
  }
}