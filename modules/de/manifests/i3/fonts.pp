# installs powerline fonts
class de::i3::fonts {

  vcsrepo { "${src_dir}/fonts":
    ensure   => latest,
    owner    => $::de::owner,
    group    => $::de::group,
    source   => 'https://github.com/powerline/fonts.git',
    revision => 'master',
    notify   => Exec['fonts_install'],
  }

  exec { 'fonts_install':
    command     => './install.sh',
    cwd         => "${src_dir}/fonts",
    refreshonly => true,
  }
}