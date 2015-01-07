class { 'php_phars':

    # Download only this file

    append => [
        {
            'app' => 'lorem',
            'url' => 'http://symfony.com/installer'
        }
    ],

}
