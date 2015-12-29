# clone a yadm repo
class yadm::clone (
  $repo = undef,
  $dest = "/home/$user/config",
){
  validate_string($repo)

  exec { 'clone-yadm-repo':
    command => "yadm clone $repo $dest",
    creates => "$dest/../.yadm/repo.git",
  }

}