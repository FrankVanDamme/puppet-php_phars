# `php_phars` Puppet Module

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What php_phars affects](#what-php_phars-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with php_phars](#beginning-with-php_phars)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Limitations](#limitations)
7. [Development](#development)
8. [Inspiration](#inspiration)

## Overview

This module `php_phars` aims to simplify the installation of
PHAR applications, like `composer`, `phpunit`, `php-cs-fixer`, etc.

## Module Description

In general:

* the module downloads a file to an arbitrary directory
* sets the owner
* sets the rights

It can be seen as a sequence of three:

* `wget`
* `chown`
* `chmod`

commands.

The module contains **a build-in catalog of well-known PHARS**, like
`composer`, `phpunit`, `php-cs-fixer`.
Thus, you dont have to care about their URLs.

You can install:

* all PHARS from the catalog
* only those PHARS from the catalog that you need
* user defined PHARS

The catalog is an array named `$catalog`:
defined in
[manifests/params.pp](https://github.com/pro-vagrant/puppet-php_phars/blob/master/manifests/params.pp)
file. The fragment of this array is shown in [Reference](#reference).

## Setup

### What `php_phars` affects

Module:

* downloads files (e.g. `https://getcomposer.org/composer.phar`)
* saves them under a given name (e.g. `composer`) in an arbitrary directory (e.g. `/usr/local/bin`)
* sets the owner (e.g. `root`)
* sets the rights (e.g. `a+x`)

This operation can be executed:

* all PHARS from the catalog
* only chosen PHARS from the catalog
* user defined PHARS

### Setup Requirements

The module uses:

* `wget` to download files
* `maestrodev-wget` puppet module https://github.com/maestrodev/puppet-wget
* `gajdaw-filefetcher` puppet module https://github.com/pro-vagrant/puppet-filefetcher
* when missing, `wget` is automatically installed by `maestrodev-wget` module

### Beginning with `php_phars`

#### System wide install with Puppet

To install the module in your system run:

    sudo puppet module install gajdaw-php_phars

You may lock the version to avoid using the latest version:

    sudo puppet module install gajdaw-php_phars --version 0.1.0

#### System wide install with Git

You may also use `git` to install the module:

    mkdir -p /etc/puppet/modules/php_phars
    cd /etc/puppet/modules/php_phars
    git clone --depth 1 https://github.com/pro-vagrant/puppet-php_phars.git .

To lock the version, use:

    git clone --depth 1 --branch v0.1.0 https://github.com/pro-vagrant/puppet-php_phars.git .

## Usage

For a more complete list of examples
refer to `examples/` directory.

### Install all PHARS from the catalog

    # Filename: examples/all.pp

    class { 'php_phars':
        all => true,
    }

You can run the example with:

    sudo puppet apply examples/all.pp

The command will install all PHARS:

    /usr/local/bin/composer
    /usr/local/bin/phpunit
    /usr/local/bin/php-cs-fixer
    /usr/local/bin/box
    ...

By default: PHARS are not redownloaded.
Thus, when you run the command again and again:

    sudo puppet apply examples/all.pp
    sudo puppet apply examples/all.pp

nothing happens. To force redownload use `redownload` parameter.

### Install/Update all PHARS from the catalog

    # Filename: examples/all-redownload.pp

    class { 'php_phars':
        all        => true,
        redownload => true,
    }

You can run the example with:

    sudo puppet apply examples/all-redownload.pp

This example redownloads PHARS every time you run it.

### Install composer and phpunit only

    # Filename: examples/only-composer-phpunit.pp

    class { 'php_phars':
        phars      => ['composer', 'phpunit'],
        redownload => true,
    }

You can run the example with:

    sudo puppet apply examples/only-composer-phpunit.pp

### Install all PHARS from the catalog and one special file

    # Filename: examples/append-all.pp

    class { 'php_phars':

        all => true,

        append => [
            {
                'app' => 'symvirins',
                'url' => 'https://raw.githubusercontent.com/karlosagudo/symvirins/master/symvirins.phar'
            }
        ],

    }

You can run the example with:

    sudo puppet apply examples/append-all.pp

The command will install all PHARS from the catalog and:

    /usr/local/bin/symvirins

### Running phar binaries (`phpunit`, `composer`, etc.)

If php is missing, install it with:

    sudo apt-get install php5 -y

Now, you can use the binaries:

    phpunit --version
    composer --version
    php-cs-fixer --version
    box --version

### Uninstall

Currently, to uninstall files, you have to use `rm` command:

    sudo rm /usr/local/bin/composer
    sudo rm /usr/local/bin/phpunit
    sudo rm /usr/local/bin/php-cs-fixer
    sudo rm /usr/local/bin/box

## Reference

The complete list of parameters is available in
[`manifests/fetch.pp`](https://github.com/pro-vagrant/puppet-filefetcher/blob/master/manifests/fetch.pp)
file.

The catalog is an array of hashes:

    # Filename: manifests/params.pp

    ...

    $catalog = [
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

The catalog contains the following PHARS:

* `composer`
* `phpunit`
* `box v2.5.0`
* `symfony` installer
* `php-cs-fixer`

## Limitations

The module was tested on:

* Ubuntu 14.04 / Puppet 3.7

## Development

The best method I have found so far to work on Puppet modules is:

* keep all modules in a single directory of your host (`host/some/dir`)
* create a Vagrant env in the dir that contains all the modules


```
    .
    ├── puppet-filefetcher
    │   ├── examples
    │   ├── Gemfile
    │   ├── LICENSE
    │   ├── manifests
    │   ├── metadata.json
    │   ├── pkg
    │   ├── Rakefile
    │   ├── README.md
    │   ├── spec
    │   ├── tests
    │   └── tmp
    ├── puppet-php_phars
    │   ├── examples
    │   ├── Gemfile
    │   ├── LICENSE
    │   ├── manifests
    │   ├── metadata.json
    │   ├── Rakefile
    │   ├── README.md
    │   ├── spec
    │   └── tests
    └── Vagrantfile
```

Then create symbolic links to modules:

    sudo ln -s /vagrant/puppet-php_phars /etc/puppet/modules/php_phars

Working this way you can test the module without:

* building
* installing
* uploading to the Puppet Forge

The command to check CS:

    puppet-lint manifests --no-autoloader_layout-check

The commands to build a module:

    rm -rf pkg/
    puppet module build

    sudo puppet module list
    sudo puppet module install pkg/gajdaw-php_phars-0.1.0.tar.gz
    sudo puppet module uninstall gajdaw-php_phars

All the examples:

    sudo puppet apply examples/none.pp

    sudo puppet apply examples/all.pp
    sudo puppet apply examples/all-redownload.pp
    sudo puppet apply examples/all-relocate.pp

    sudo puppet apply examples/only-composer.pp
    sudo puppet apply examples/only-composer-phpunit.pp

    sudo puppet apply examples/append-none.pp
    sudo puppet apply examples/append-all.pp


## Inspiration

The inspiration came from
[`willdurrand-composer`](https://forge.puppetlabs.com/willdurand/composer)
authored
[by William Durand](https://github.com/willdurand/puppet-composer).
