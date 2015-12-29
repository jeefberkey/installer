# add repo and install package
class yadm::install {

  yumrepo { 'bintray-thelocehiliosan-rpm':
    baseurl  => 'https://dl.bintray.com/thelocehiliosan/rpm',
    gpgcheck => false,
    enabled  => true,
  }

  package { 'yadm':
    ensure  => latest,
    require => Yumrepo['bintray-thelocehiliosan-rpm'],
  }

}