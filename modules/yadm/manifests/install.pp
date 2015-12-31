# add repo and install package
class yadm::install {

  yumrepo { 'bintray-thelocehiliosan-rpm':
    baseurl  => 'https://dl.bintray.com/thelocehiliosan/rpm',
    gpgcheck => 0,
    enabled  => 1,
  }

  package { 'yadm':
    ensure  => latest,
    require => Yumrepo['bintray-thelocehiliosan-rpm'],
  }

}