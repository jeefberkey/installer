# configure i3
class i3::config {
  file { "$::homedir/.config/i3/config":
    ensure  => present,
    content => 'puppet:///modules/i3/config',
  }
}