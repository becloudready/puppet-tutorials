class nginx::setup {
	$nginx_root_dir = '/usr/share/nginx/html'
	exec{'get_index_file':
  		command => "git clone https://github.com/puppetlabs/exercise-webpage /tmp/exercise; git pull;cp /tmp/exercise/index.html ${nginx_root_dir}/",
  		creates => "/tmp/exercise/index.html",
		path => ["/usr/bin","/bin"],
		require => Class["git","nginx::install"],
		notify => Service['nginx'],
	}
	exec{'get_latest_index':
		command => "git -C /tmp/exercise pull;cp /tmp/exercise/index.html ${nginx_root_dir}/",
		onlyif => ["test -d /tmp/exercise","test -d /usr/share/nginx/html"],
		path => ["/usr/bin","/bin"],
		require => Class["git","nginx::install"],
		notify => Service['nginx'],
	}

}
