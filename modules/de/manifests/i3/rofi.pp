class de::i3::rofi {

  ensure_packages([
    'gcc',
    'make',
    'autoconf',
    'automake',
    'pkgconfig',
    'libxinerama',
    'cairo',
    'libxkbcommon',
    'libxkbcommon-x11',
    'libxcb',
    'libxcb-devel',
    'xcb-util',
    'xcb-util-devel',
    'xcb-util-wm',
  ])

  vcsrepo { "${src_dir}/rofi":
    ensure   => latest,
    owner    => $::de::owner,
    group    => $::de::group,
    source   => 'https://github.com/DaveDavenport/rofi.git',
    revision => 'master',
    notify   => Exec['rofi_install'],
  }

  exec { 'rofi_install':
    command     => './autoreconf -i && mkdir build && cd build && ../configure --prefix=/usr/ && make && sudo make install',
    cwd         => "${src_dir}/rofi",
    refreshonly => true,
  }
}