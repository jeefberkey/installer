#installs VirtualBox from the oracle repo
class de::vbox {

  ensure_packages([ 'binutils','gcc','make','patch','libgomp','glibc-headers','glibc-devel','kernel-headers','kernel-devel','dkms', ])

  yumrepo { 'virtualbox':
    baseurl       => 'http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch',
    descr         => 'The virtualbox repository',
    enabled       => '1',
    gpgcheck      => '1',
    repo_gpgcheck => '1',
    gpgkey        => 'https://www.virtualbox.org/download/oracle_vbox.asc',
  }

  package { 'VirtualBox-5.1':
    ensure  => installed,
    require => Yumrepo['virtualbox'],
  }

}