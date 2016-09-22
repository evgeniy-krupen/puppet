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
  require => Package['puppetserver'],
  }
}

else {
  notice ( "install for client" )
  host { 'puppet.minsk.epam.com':
  host_aliases => 'puppet',
  ip           => '192.168.25.110',
  }
  package { 'puppet-agent':
  ensure => 'latest',
  }
  service { 'puppet':
  ensure => 'running',
  }
}


