define mountpoint ( $mountlist= undef, 
					$source = undef,
					$dest = undef,

	file {'/root/mount-script.sh':
		path => '/root/mount-script.sh',
		ensure => file,
		mode => 0755,
		source => 'puppet://modules/mountpoint/mount-script.sh'
	}

	exec {'mount-script':
		command => "/root/mount-script.sh",
		refreshonly => true,
	}

	$mountlist.each |String $mount| {
		file {"/etc/mountpoint_cfgs/$mount":
			ensure => file,
			source => "puppet://modules/mountpoint/$mount.cfg",
			notify => Exec['mount-script'],
		}
			
	}

}
