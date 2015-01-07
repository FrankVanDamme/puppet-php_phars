# = Class: php_phars::params
#
# This class defines default parameters used by the main module
# class `php_phars`.
#
# == Variables:
#
# Refer to `php_phars` class for the variables defined here.
#
# == Usage:
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes.
#
class php_phars::params {
  $target_dir = '/usr/local/bin'
  $user       = 'root'
  $rights     = 'a+x'
  $redownload = false

  $all = false

  #
  # Required keys: app, url
  # Optional keys: target_dir, user, rights, redownload
  #
  $list_of_phars = [
    {
        'app' => 'composer',
        'url' => 'https://getcomposer.org/composer.phar'
    },
    {
        'app' => 'phpunit',
        'url' => 'https://phar.phpunit.de/phpunit.phar'
    },
    {
        'app' => 'php-cs-fixer',
        'url' => 'http://cs.sensiolabs.org/get/php-cs-fixer.phar'
    },
    {
        'app' => 'box',
        'url' => 'https://github.com/box-project/box2/releases/download/2.5.0/box-2.5.0.phar'
    },
    {
        'app' => 'symfony',
        'url' => 'http://symfony.com/installer'
    }
  ]
}
