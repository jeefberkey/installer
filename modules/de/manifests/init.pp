# == Class: de
#
class de (
  String $user = '',
  String $group = '',
  String $fullname = ''

  String $userdir = "/home/nick/$::user",
  String $configdir = "$::userdir/src",
) {
  include 'git'

  file { '/home/$user/src':
    ensure => directory,
    mode => '0644',
    owner => $user,
    group = $group
  }
}