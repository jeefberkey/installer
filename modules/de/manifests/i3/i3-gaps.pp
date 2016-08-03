class de::i3::i3-gaps {

  ensure_packages([
      'libxcb-devel',
      'xcb-util-keysyms-devel',
      'xcb-util-devel',
      'xcb-util-wm-devel',
      'yajl-devel',
      'libXrandr-devel',
      'startup-notification-devel',
      'libev-devel,'
      'xcb-util-cursor-devel',
      'libXinerama-devel',
      'libxkbcommon-devel',
      'libxkbcommon-x11-devel',
      'pcre-devel',
      'pango-devel',
      'git',
      'gcc'
    ])

  vcsrepo { "$src_dir/i3-gaps":
    ensure => latest,
    owner => $::de::owner,
    group => $::de::group,
    source => 'https://github.com/airblader/i3',
    revision => 'gaps-next',
    notify => Exec['i3-gaps_install']
  }

  exec { 'i3-gaps_install':
    command => 'make && sudo make install',
    cwd => "$src_dir/i3-gaps",
    refreshonly => true,
  }
}