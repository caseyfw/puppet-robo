# = Class: robo::params
#
# This class defines default parameters used by the main module class robo.
# Operating Systems differences in names and paths are addressed here.
#
# == Variables:
#
# Refer to robo class for the variables defined here.
#
# == Usage:
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes.
#
class robo::params {
  $phar_location = 'https://robo.li/robo.phar'
  $target_dir    = '/usr/local/bin'
  $command_name  = 'robo'
  $user          = 'root'
}
