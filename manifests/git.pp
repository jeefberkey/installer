# installs git and my configuration
class git (
  $remote_username = $::user,
  $username = $::user,
  $email = undef,
) {

  ensure_packages([ 'git','git-review','gitg','meld' ])

  exec { 'git_config_credential_username':
    command => "git config --global credential.username ${remote_username}",
    require => Package['git'],
  }
  exec { 'git_config_credential_helper':
    command => 'git config --global credential.helper cache',
    require => Package['git'],
  }
  exec { 'git_config_push_default':
    command => 'git config --global push.default simple',
    require => Package['git'],
  }
  exec { 'git_config_core_editor':
    command => 'git config --global core.editor vim',
    require => Package['git'],
  }
}
