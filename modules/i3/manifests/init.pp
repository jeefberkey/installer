# installs the i3 package and Airblader/i3 on top of it
class i3 (
  $user          = $i3::params::user,
  $group         = $i3::params::group,
  $gaps          = $i3::params::gaps,
  $branch        = $i3::params::branch,
  $repo_location = $i3::params::repo_location,
  $homedir       = $i3::params::homedir,
) inherits ::i3::params {

  validate_bool($gaps)
  validate_re($branch, ['gaps', 'gaps-next'])
  validate_absolute_path($repo_location)
  validate_absolute_path($homedir)

  include '::i3::install'
  include '::i3::config'

  Class['::i3::install'] ->
  Class['::i3::config']

}