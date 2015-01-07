class { 'php_phars':
    #
    # Update all predefined PHARS
    # with default settings:
    #
    #    filename:   key from hash table
    #    url:        value from hash table
    #
    #    directory:  /usr/local/bin
    #    user:       root
    #    rights:     a+x
    #

    all        => true,
    redownload => true
}
