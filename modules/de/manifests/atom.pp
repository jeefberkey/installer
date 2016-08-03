# installs atom
class de::atom {
  package { 'atom':
    ensure  => latest,
    require => Yumrepo['unitedrpms'],
  }
}