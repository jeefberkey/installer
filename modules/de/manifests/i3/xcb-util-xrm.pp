class de::i3::xcb-util-xrm {

  ensure_packages([
      'gcc',
      'xorg-macros'
    ])

  vcsrepo { "$src_dir/xcb-util-xrm":
    ensure => latest,
    owner => $::de::owner,
    group => $::de::group,
    source => 'https://github.com/airblader/xcb-util-xrm',
    revision => 'master',
    notify => Exec['xcb-util-xrm_install']
  }

  exec { 'xcb-util-xrm_install':
    command => './autogen.sh && ./configure && make && sudo make install',
    cwd => "$src_dir/xcb-util-xrm",
    refreshonly => true,
  }
}