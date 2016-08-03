class de::i3::i3blocks-gaps {

  ensure_packages([
    'lm_sensors',
    'acpi',
    'sysstat',
  ])

  vcsrepo { "$src_dir/i3blocks-gaps":
    ensure => latest,
    owner => $::de::owner,
    group => $::de::group,
    source => 'https://github.com/airblader/i3blocks-gaps.git',
    revision => 'master',
    notify => Exec['i3blocks-gaps_install']
  }

  exec { 'i3blocks-gaps_install':
    command => 'make clean all && sudo make install',
    cwd => "$src_dir/i3blocks-gaps",
    refreshonly => true,
  }
}