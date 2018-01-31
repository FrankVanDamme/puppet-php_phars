#
# This definition should be named filefetcher::multi_fetch
#

define php_phars::process_array (
    $target_dir   = undef,
    $user         = undef,
    $rights       = undef,
    $redownload   = undef,
    $filters      = undef,
    Array $append = undef,
) {

    include stdlib

    $append.each | $application | {

      if is_hash($application) and has_key($app, 'app') and has_key($app, 'url') {

	# TODO
	#
	# If $application['user'] is set it should be used
	# otherwise use $user passed to the resource
	#
	# The same mode of action for other params:
	#    - target_dir
	#    - user
	#    - rights
	#    - redownload
	#

	if (!$filters) or ($application['app'] in $filters) {

	    filefetcher::fetch { $application['app']:
		url        => $application['url'],
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
}
