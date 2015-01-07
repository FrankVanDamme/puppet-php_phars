class { 'php_phars':

    # Download composer.phar
    # and one special file.
    #
    # Redownload them each time

    target_dir => '/tmp',
    user       => 'vagrant',
    rights     => '713',

    phars => ['composer'],

    append => [
        {
            'app' => 'some-json-file',
            'url' => 'https://raw.githubusercontent.com/symfony/symfony-standard/2.7/composer.json'
        }
    ],

}
