class { 'php_phars':

    # Download only this file

    append => [
        {
            'app' => 'symvirins',
            'url' => 'https://raw.githubusercontent.com/karlosagudo/symvirins/master/symvirins.phar'
        }
    ],

}
