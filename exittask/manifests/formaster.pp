class exittask::formaster {
# add yum repo for latest puppet
  yumrepo { 'puppetlabs-pc1':
    ensure => 'present',
    baseurl => 'http://yum.puppetlabs.com/el/7/PC1/$basearch',
    descr => 'Puppet Labs PC1 Repository el 7 - $basearch',
    enabled => '1',
    gpgcheck => '1',
    gpgkey => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
  }
  notice ( "Hostname is $::hostname" )
# install puppetserver
  package { 'puppetserver':
  ensure => 'installed',
  }
# source bash_profile
  exec { 'root_bash_profile':
  command => "source /root/.bash_profile",
  provider => shell,
  }

# create autosign file
  file { '/etc/puppetlabs/puppet/autosign.conf':
    content => template('exittask/autosign.erb'),
    ensure => file,
    owner => root,
    group => root,
    mode => '0644',
    backup => false,
  }

# run service
  service { 'puppetserver':
  ensure => 'running',
  require => File['/etc/puppetlabs/puppet/autosign.conf'],
  }
  notice ( "!!!!!!!!!!!!!!!!!!!!its class formaster" )
}
