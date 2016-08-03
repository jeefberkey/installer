# installs additions blocks for i3blocks
class de::i3::i3blocks_contrib {
  vcsrepo { "${src_dir}/i3blocks-contrib":
    ensure   => latest,
    owner    => $::de::owner,
    group    => $::de::group,
    source   => 'https://github.com/airblader/i3blocks-contrib.git',
    revision => 'master',
    notify   => Exec['i3blocks-contrib_install'],
  }
}