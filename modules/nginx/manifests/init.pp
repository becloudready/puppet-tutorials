class nginx {
	include nginx::install
	include nginx::service
	include nginx::config
	include nginx::setup
}
