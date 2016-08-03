# misc packages
class de::neovim {
  yumrepo { '_copr_dperson-neovim-head.':
    baseurl          => 'https://copr-be.cloud.fedoraproject.org/results/dperson/neovim-head/fedora-$releasever-$basearch/',
    descr            => 'Copr repo for neovim-head owned by dperson',
    enabled          => '1',
    gpgcheck         => '1',
    gpgkey           => 'https://copr-be.cloud.fedoraproject.org/results/dperson/neovim-head/pubkey.gpg',
    enabled_metadata => '1',
  }
}