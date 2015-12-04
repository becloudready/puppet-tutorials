class nginx::config {
	$listen_port = 8000
	file {'/etc/nginx/sites-available/default':
		ensure => present,
		require => Class['nginx::install'],
		content => template('nginx/default.erb'),
	}
}
