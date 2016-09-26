#
#
class exittask::formaster ($version = '2.6.0-1.el7') {
# add yum repo for latest puppet
  yumrepo { 'puppetlabs-pc1':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/7/PC1/$basearch',
    descr    => 'Puppet Labs PC1 Repository el 7 - $basearch',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
  }
  notice ( "Hostname is ${::hostname}" )
# install puppetserver
  package { 'puppetserver':
  ensure => '$version',
  }
# source bash_profile
  exec { 'root_bash_profile':
  command   => 'source /root/.bash_profile',
  provider  => shell,
  subscribe => File['/etc/puppetlabs/puppet/autosign.conf']
  }

# create autosign file
  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => file,
    content => template('exittask/autosign.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    backup  => false,
    require => Package['puppetserver']
  }

# run service
  service { 'puppetserver':
  ensure  => 'running',
  require => File['/etc/puppetlabs/puppet/autosign.conf'],
  }
  notice ( '!!!!!!!!!!!!!!!!!!!!its class formaster' )
}
