class { 'php_phars':

    # Download composer.phar
    # and one special file.
    #
    # Use special settings for dir/user/rights

    target_dir => '/tmp',
    user       => 'vagrant',
    rights     => '713',

    phars => ['composer'],

    append => [
        {
            'app' => 'symfony-homepage',
            'url' => 'http://symfony.com'
        }
    ],

}
