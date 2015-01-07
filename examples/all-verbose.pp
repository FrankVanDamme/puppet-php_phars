class { 'php_phars':

    #
    # Download all predefined PHARS
    #
    # Verbose version

    phars => ['composer', 'phpunit', 'box', 'symfony', 'php-cs-fixer'],
}
