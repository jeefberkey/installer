# clone a yadm repo
class yadm::clone (
  $repo    = undef,
  $user    = 'root',
  $group   = 'root',
  $homedir = '/tmp'
){
  validate_string($repo)
  validate_absolute_path($homedir)

  exec { 'clone-yadm-repo':
    cwd      => $homedir,
    command  => "HOME=$homedir yadm clone $repo -f ; yadm ls-files --deleted | xargs yadm checkout -- | true",
    creates  => "$homedir/.yadm/repo.git",
    user     => $user,
    group    => $group,
    provider => 'shell',
  }

}