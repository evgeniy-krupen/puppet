if $::hostname == 'client' {
  notice ( "Hostname is client" )
  package { 'puppet-agent':
  ensure => 'latest',
  }

  service { 'puppet':
  ensure => 'running',
  }
}

else {
notice ( "install for server" )
}


