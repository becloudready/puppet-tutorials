class puppet-mount 
(
	$source = undef,
  $dest   = undef,
  $type   = undef,
  $opts   = 'defaults',
  $dump   = 0,
  $passno = 0,
  $ensure = 'present')
{
	class {'puppet-mount::install':
		source => $source,
		dest => $dest,
		type => $opts,
		opts =>	$opts,
		dump => $dump,
		passno => $passno,
		ensure => $ensure,
	}
	class { 'puppet-mount::config':
		source => $source,
		dest => $dest,
		type => $opts,
		opts =>	$opts,
		dump => $dump,
		passno => $passno,
		ensure => $ensure,
	}
}
