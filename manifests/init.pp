# == Class: php_phars
#
# The class to download and install PHAR applications:
# composer.phar, phpunit.phar, etc.
#
#
# === Parameters
#
# [*target_dir*]
#   The directory in which the downloaded file will be stored.
#   Defaults to: '/usr/local/bin'
#
# [*user*]
#   The owner of the box executable.
#   Defaults to: 'root'
#
# [*rights*]
#   The rights for the newly created file.
#   Defaults to: 'a+x'
#
# [*redownload*]
#   Boolean flag to force redownload if the file already exists.
#   Defaults to: false
#
# [*all*]
#   Boolean flag to download all PHARS frorm the catalog.
#   Defaults to: false
#
# [*phars*]
#   List of PHARS to install from the catalog.
#   Defaults to: undef
#   Example value: ['composer', 'phpunit']
#
# [*append*]
#   List of additional PHARS to install (not from the catalog).
#   Defaults to: undef
#   Example value: [ { 'app' => 'lorem', 'url' => 'http://example.net/lorem.phar']
#
#
# === Examples
#
# Install all the PHARS from the catalog:
#
#    class { 'php_phars':
#        all => true,
#    }
#
#
#
# Install all the PHARS from the catalog
# Redownload everytime this manifest is processed
#
#    class { 'php_phars':
#        all        => true,
#        redownload => true,
#    }
#
#
# Install composer and phpunit only
#
#    class { 'php_phars':
#        phars      => ['composer', 'phpunit'],
#    }
#
#
# Install composer and phpunit only
# Redownload everytime this manifest is processed
#
#    class { 'php_phars':
#        phars      => ['composer', 'phpunit'],
#        redownload => true,
#    }
#
#
#
#
# Install all the PHARS from the catalog and symvirins
#
#    class { 'php_phars':
#
#        all => true,
#
#        append => [
#            {
#                'app' => 'symvirins',
#                'url' => 'https://raw.githubusercontent.com/karlosagudo/symvirins/master/symvirins.phar'
#            }
#        ],
#
#    }
#
#
#
# Install only symvirins
#
#    class { 'php_phars':
#
#        append => [
#            {
#                'app' => 'symvirins',
#                'url' => 'https://raw.githubusercontent.com/karlosagudo/symvirins/master/symvirins.phar'
#            }
#        ],
#
#    }
#
#
#
# === Authors
#
# Włodzimierz Gajda <gajdaw@gajdaw.pl>
#
# === Copyright
#
# Copyright 2015 Włodzimierz Gajda
#

class php_phars (
  $target_dir = undef,
  $user       = undef,
  $rights     = undef,
  $redownload = undef,
  $all        = undef,
  $phars      = undef,
  $append     = undef,
) {

  # if all is set to true phars parameter should be ignored

  include php_phars::params

  $param_target_dir = $target_dir ? {
    undef   => $::php_phars::params::target_dir,
    default => $target_dir
  }

  $param_user = $user ? {
    undef   => $::php_phars::params::user,
    default => $user
  }

  $param_rights = $rights ? {
    undef   => $::php_phars::params::rights,
    default => $rights
  }

  $param_redownload = $redownload ? {
    undef   => $::php_phars::params::redownload,
    default => $redownload
  }

  $param_all = $all ? {
    undef   => $::php_phars::params::all,
    default => $all
  }

  $param_phars = $phars

  $param_append = $append

  if $param_all == true {
    php_phars::process_array { $::php_phars::params::catalog:

      target_dir => $param_target_dir,
      user       => $param_user,
      rights     => $param_rights,
      redownload => $param_redownload,
    }
  }

  if $param_phars {
    php_phars::process_array { $::php_phars::params::catalog:

      target_dir => $param_target_dir,
      user       => $param_user,
      rights     => $param_rights,
      redownload => $param_redownload,
      filters    => $param_phars,
    }
  }

  if $append {
    php_phars::process_array { $append:

      target_dir => $param_target_dir,
      user       => $param_user,
      rights     => $param_rights,
      redownload => $param_redownload,
    }
  }

}