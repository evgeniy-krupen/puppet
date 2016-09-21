if $::hostname == 'puppet' {
  notice ( "Hostname is $::hostname" )
  package { 'puppetserver':
  ensure => 'installed',
  }
  exec { 'root_bash_profile':
  command => "source /root/.bash_profile",
  provider => shell,
  }
  service { 'puppetserver':
  ensure => 'running',
  require => package['puppetserver'],
  }
}

else {
  notice ( "install for client" )
  package { 'puppet-agent':
  ensure => 'latest',
  }
  service { 'puppet':
  ensure => 'running',
  }
}


