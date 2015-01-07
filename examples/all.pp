class { 'php_phars':
    #
    # Download all predefined PHARS
    # with default settings:
    #
    #    filename:   key from hash table
    #    url:        value from hash table
    #
    #    directory:  /usr/local/bin
    #    user:       root
    #    rights:     a+x
    #    redownload: false
    #
    # Do not redownload PHARS that are already present.
    #

    all => true,
}
