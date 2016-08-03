# compile and install compton
class de::i3::compton {

  ensure_packages([
    'libx11',
    'libxcomposite',
    'libxdamage',
    'libxfixes',
    'libXext',
    'libxrender',
    'libXrandr',
    'libXinerama',
    'pkg-config',
    'make',
    'xorg-x11-utils',
    'pcre',
    'libconfig',
    'libdrm',
    'mesa-libGL',
    'dbus-libs',
    'asciidoc',
  ])

  vcsrepo { "${src_dir}/compton":
    ensure   => latest,
    owner    => $::de::owner,
    group    => $::de::group,
    source   => 'https://github.com/chjj/compton.git',
    revision => 'master',
    notify   => Exec['compton_install'],
  }

  exec { 'compton_install':
    command     => 'make && make docs && sudo make install',
    cwd         => "${src_dir}/compton",
    refreshonly => true,
  }
}