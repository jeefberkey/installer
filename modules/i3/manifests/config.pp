# configure i3
class i3::config {
  include '::i3::config::i3blocks'

  file { "$::homedir/.config/i3":
    ensure => directory,
    owner  => $::i3::user,
    group  => $::i3::group,
  }

  file { "$::homedir/.config/i3/config":
    ensure  => present,
    content => 'puppet:///modules/i3/config',
  }
}