# compiles and install dunst
class de::i3::dunst {

  ensure_packages([
    'libXinerama',
    'iniparser',
    'make',
  ])

  vcsrepo { "${src_dir}/dunst":
    ensure   => latest,
    owner    => $::de::owner,
    group    => $::de::group,
    source   => 'https://github.com/knopwob/dunst.git',
    revision => 'master',
    notify   => Exec['dunst_install'],
  }

  exec { 'dunst_install':
    command     => 'make && sudo make install',
    cwd         => "${src_dir}/dunst",
    refreshonly => true,
  }
}