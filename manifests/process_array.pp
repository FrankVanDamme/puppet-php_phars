#
# This definition should be named filefetcher::multi_fetch
#

define php_phars::process_array (
  $target_dir = undef,
  $user       = undef,
  $rights     = undef,
  $redownload = undef,
  $filters    = undef
) {

    include stdlib

    if is_hash($name) and has_key($name, 'app') and has_key($name, 'url') {

      # TODO
      #
      # If $name['user'] is set it should be used
      # otherwise use $user passed to the resource
      #
      # The same mode of action for other params:
      #    - target_dir
      #    - user
      #    - rights
      #    - redownload
      #

      if (!$filters) or ($name['app'] in $filters) {

          filefetcher::fetch { $name['app']:
              url        => $name['url'],
              target_dir => $target_dir,
              user       => $user,
              rights     => $rights,
              redownload => $redownload,
          }

      }

    } else {
        fail('ERROR #1 in php_phars::process_array')
    }

}