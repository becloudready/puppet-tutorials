class puppet-mount::config
	($source = undef,
  $dest   = undef,
  $type   = undef,
  $opts   = 'defaults',
  $dump   = 0,
  $passno = 0,
  $ensure = 'present')
{
	exec {'mount-command':
		command => '/bin/mount -a',
		refreshonly => true,
		}
	$conf_dir="/etc/mountpoint_cfg"
	if $ensure == 'present' {
		file { '/etc/mountpoint_cfg':
			ensure => directory,
		}
		file {"${conf_dir}/mount.cfg":
			ensure => present,
			content => template('puppet-mount/mount.cfg.erb'),
			notify => Exec['mount-command'],	
	}		
}
}
