class { 'php_phars':

    # Incorrect data for append
    # app key is mandatory

    append => [
        {
#            'app' => 'some-json-file',
            'url' => 'https://raw.githubusercontent.com/symfony/symfony-standard/2.7/composer.json'
        }
    ],

}
