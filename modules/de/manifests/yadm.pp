# == Class: de::yadm
#
# Installs yadm and pulls a config repo
#
class de::yadm (
  $yadm_repo
) {
  yumrepo { 'bintray--thelocehiliosan-rpm':
    baseurl => 'http://dl.bintray.com/thelocehiliosan/rpm',
    descr => 'The yadm repository',
    enabled => '1',
    gpgcheck => '0'
  }

  package { 'yadm':
    ensure => latest,
    require => Yumrepo['bintray--thelocehiliosan-rpm']
  }

  exec { "yadm-clone-$::yadm_repo":
    command => "yadm clone $yadm_repo",
    creates => "/home/$::de::user/.yadm",
    require => Package['yadm']
  }
}