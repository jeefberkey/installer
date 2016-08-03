# united rpm's chromium
class de::chrome {
  package { 'chromium':
    ensure  => latest,
    require => Yumrepo['unitedrpms'],
  }
}