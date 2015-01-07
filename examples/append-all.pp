class { 'php_phars':

    # Download all predefined PHARS
    # and one more file

    all => true,

    append => [
        {
            'app' => 'symvirins',
            'url' => 'https://raw.githubusercontent.com/karlosagudo/symvirins/master/symvirins.phar'
        }
    ],

}
