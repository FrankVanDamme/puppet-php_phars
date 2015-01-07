class { 'php_phars':

    # Download all predefined PHARS
    # and one more file

    all => true,

    append => [
        {
            'app' => 'lorem',
            'url' => 'http://symfony.com/installer'
        }
    ],

}
