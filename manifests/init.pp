# = Class: robo
#
# == Parameters:
#
# [*target_dir*]
#   Where to install the robo executable.
#
# [*command_name*]
#   The name of the robo executable.
#
# [*user*]
#   The owner of the robo executable.
#
# == Example:
#
#   include robo
#
#   class { 'robo':
#     'target_dir'   => '/usr/local/bin',
#     'user'         => 'root',
#     'command_name' => 'robo'
#   }
#
class robo (
  $target_dir   = 'UNDEF',
  $command_name = 'UNDEF',
  $user         = 'UNDEF'
) {

  include robo::params

  $robo_target_dir = $target_dir ? {
    'UNDEF' => $::robo::params::target_dir,
    default => $target_dir
  }

  $robo_command_name = $command_name ? {
    'UNDEF' => $::robo::params::command_name,
    default => $command_name
  }

  $robo_user = $user ? {
    'UNDEF' => $::robo::params::user,
    default => $user
  }

  wget::fetch { 'robo-install':
    source      => $::robo::params::phar_location,
    destination => "${robo_target_dir}/${robo_command_name}",
    execuser    => $robo_user,
  }

  exec { 'robo-fix-permissions':
    command => "chmod a+x ${robo_command_name}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    cwd     => $robo_target_dir,
    user    => $robo_user,
    unless  => "test -x ${robo_target_dir}/${robo_command_name}",
    require => Wget::Fetch['robo-install'],
  }
}
