class { 'php_phars':
    #
    # Download all predefined PHARS to /tmp
    #
    # Caution: the files from /usr/local/bin are not removed!

    all        => true,
    target_dir => '/tmp',
}
