# set the global exec path
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

$packages = [
  #base
  'tmux','network-manager-applet','feh','xdotool','lxinput','lxappearance','gtk-murrine-engine','w3m-img','golang','gimp','xbacklight',

  #vbox
  'binutils','gcc','make','patch','libgomp','glibc-headers','glibc-devel','kernel-headers','kernel-devel','dkms',

  #lighter display maanger
  'lightdm','lightdm-gtk-greeter-settings',
  'gtk-doc','gobject-introspection-devel','dbus-python','python-simplejson',
  'gnome-keyring-pam','libgnome-keyring-devel','gnome-tweak-tool',

  #i3blocks
  'python-imaging','lm_sensors','acpi','sysstat',

  'cmake','rubygem-ronn',

  #rofi
  'autoconf','automake','libXft-devel','glib2-devel','libX11-devel',
  'libstdc++.i686','ncurses-libs.i686','zlib.i686','libconfig-devel',
  'dbus-glib-devel', 'libXScrnSaver-devel', 'libnotify-devel', 'libxdg-basedir-devel',
]

$storage_dir = '/home/nick/config'

package { $packages:
  ensure   => latest,
  provider => 'dnf',
}

# install yadm, my tool of choice for configuration management
# also clone my config repo from github using yadm
include '::yadm'
class { '::yadm::clone':
  repo => 'https://github.com/jeefberkey/dotfiles.git',
  dest => $storage_dir,
}

# installs git and sets up my basic --global config options
class { '::git':
  remote_username => 'jeefberkey',
  username        => 'Nick Miller',
  email           => 'nick.miller@onyxpoint.com',
}

class { '::i3':
  gaps          => true,
  branch        => 'gaps-next',
  repo_location => "$storage_dir/i3-gaps",
}

#rvm::system_user { 'nick': }
#rvm_system_ruby {
#  'ruby-1.9':
#    ensure      => present;
#  'ruby-2.0':
#    ensure      => present,
#    default_use => true;
#}

#hiera_include('common')
