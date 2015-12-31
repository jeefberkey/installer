# installs i3blocks
class i3::config::i3blocks {

  ensure_packages([ 'rubygem-ronn','lm_sensors','acpi','sysstat', ])

  $repo_location = "$::i3::working_dir/i3blocks"

  vcsrepo { $repo_location:
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/vivien/i3blocks.git',
  }
  ~>
  exec { 'i3blocks-make-make_install':
    cwd       => $repo_location,
    command   => 'make && make install',
    logoutput => true,
  }
  ~>
  file { '/usr/local/bin':
    ensure  => directory,
    recurse => true,
    source  => "file:///$repo_location/scripts",
    owner   => 'root',
    group   => 'root',
    mode    => '0555',
    require => Vcsrepo[$repo_location],
  }
  
  file { "$homedir/.config/i3/i3blocks.conf":
    ensure  => present,
    content => 'puppet:///modules/i3/i3blocks.conf',
    require => Exec['i3-gaps-make-make_install'],
  }
}