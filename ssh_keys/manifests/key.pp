define ssh_keys::key ($user) {

	$homevar = "::homedir_$user"
	$home = inline_template("<%= scope.lookupvar(homevar) %>")

	if $home != undef {

	file { "$home/.ssh/":
		ensure => directory,
	}

	file { "$home/.ssh/authorized_keys":
		ensure => file,
		source => "puppet:///modules/ssh_keys/$user",
		}
	}

}

