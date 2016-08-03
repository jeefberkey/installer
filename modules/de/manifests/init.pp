#
class de (
  String $user = undef,
  String $group = undef,
  String $fullname = undef

  AbsolutePath $userdir = "/home/nick/${::user}",
  AbsolutePath $configdir = "${::userdir}/src",
) {
  include '::git'

  file { '/home/$user/src':
    ensure => directory,
    mode   => '0644',
    owner  => $user,
    group  => $group,
  }
}