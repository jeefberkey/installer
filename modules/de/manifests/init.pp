#
class de (
  String $user = undef,
  String $group = undef,
  String $fullname = undef

  AbsolutePath $userdir = "/home/nick/${::user}",
  AbsolutePath $configdir = "${::userdir}/src",
) {

  file { '/home/$user/src':
    ensure => directory,
    mode   => '0644',
    owner  => $user,
    group  => $group,
  }

  yumrepo { 'unitedrpms':
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => 'https://raw.githubusercontent.com/UnitedRPMs/unitedrpms.github.io/master/URPMS-GPG-PUBLICKEY-Fedora-24',
    mirrorlist => 'https://raw.githubusercontent.com/UnitedRPMs/unitedrpms.github.io/master/mirrorlist_enjoy24_x86_64.txt',
  }

  package { 'gdm':
    ensure => latest,
    before => Class['::de::i3'],
  }

  include '::git'
  include '::de::user'
  include '::de::yadm'
  include '::de::i3'
  include '::de::vbox'
  include '::de::neovim'
  include '::de::chrome'
  include '::de::atom'
}