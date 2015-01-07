class { 'php_phars':

    # Download composer and phpunit
    # Redownload them each time

    phars      => ['composer', 'phpunit'],
    redownload => true,
}
