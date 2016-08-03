#installs VirtualBox from the oracle repo
class de::vbox {

  ensure_packages([ 'binutils','gcc','make','patch','libgomp','glibc-headers','glibc-devel','kernel-headers','kernel-devel','dkms', ])




}