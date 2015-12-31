# global variables
$user        = 'nick'
$group       = 'nick'
$homedir     = "/home/$user"
$storage_dir = "/home/$user/config"

# set some global resource settings
Exec {
  path => [
    '/usr/local/bin',
    '/usr/local/sbin',
    '/usr/bin',
    '/usr/sbin',
    '/bin',
    '/sbin',
  ],
}
File {
  owner => $user,
  group => $group,
}
Package {
  provider => 'dnf',
}

$packages = [
  #base
  'zsh','tmux','network-manager-applet','feh','lxinput','lxappearance','gtk-murrine-engine','golang','xbacklight',

  #lighter display maanger
  'lightdm','lightdm-gtk-greeter-settings',
  'gtk-doc','gobject-introspection-devel','dbus-python','python-simplejson',
  'gnome-keyring-pam','libgnome-keyring-devel','gnome-tweak-tool',

  'cmake',

  #rofi
  'autoconf','automake','libXft-devel','glib2-devel','libX11-devel',
  'libstdc++.i686','ncurses-libs.i686','zlib.i686','libconfig-devel',
  'dbus-glib-devel', 'libXScrnSaver-devel', 'libnotify-devel', 'libxdg-basedir-devel',
]

user { $user:
  ensure  => present,
  comment => 'Nick Miller',
  home    => "/home/$user",
  shell   => '/bin/zsh',
  require => Package['zsh'],
}
file { "/home/$user":
  ensure => directory,
}

package { $packages:
  ensure   => latest,
}

# install yadm, my tool of choice for configuration management
# also clone my config repo from github using yadm
include '::yadm'
class { '::yadm::clone':
  user    => $user,
  group   => $group,
  homedir => $homedir,
  repo    => 'https://github.com/jeefberkey/dotfiles.git',
}
->
class { '::i3':
  gaps    => true,
  branch  => 'gaps-next',
  user    => $user,
  group   => $group,
  homedir => $homedir,
  # working_dir => $storage_dir,
  require => Class['::yadm::clone'],
}


# # installs git and sets up my basic --global config options
# class { '::git':
#   remote_username => 'jeefberkey',
#   username        => 'Nick Miller',
#   email           => 'nick.miller@onyxpoint.com',
# }

#rvm @global do gem install bundler
#rvm::system_user { 'nick': }
#rvm_system_ruby {
#  'ruby-1.9':
#    ensure      => present;
#  'ruby-2.0':
#    ensure      => present,
#    default_use => true;
#}

#hiera_include('common')
