# install i3 and Airblader/i3 on top of it
class i3::install {

  $deps = [ 'libev-devel','libxcb-devel','libXinerama-devel','libxkbcommon-devel','libXrandr-devel','pango-devel','pcre-devel','startup-notification-devel','xcb-util-cursor-devel','xcb-util-devel','xcb-util-keysyms-devel','xcb-util-wm-devel','yajl-devel', ]

  package { 'i3': ensure => latest, }

  if $::i3::gaps {
    package {
      $deps: ensure => latest
    }
    ->
    vcsrepo { $::i3::repo_location:
      ensure   => latest,
      provider => git,
      source   => 'https://github.com/Airblader/i3.git',
      revision => $::i3::branch,
    }
    ~>
    exec { 'i3-gaps-make-make_install':
      cwd       => $::i3::repo_location,
      command   => 'make && sudo make install',
      user      => $::user,
      group     => $::group,
      logoutput => true,
    }
  }

}