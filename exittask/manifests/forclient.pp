#
#
class exittask::forclient {
  notice ( '!!!!!!!!!!!!!!!!!!!its class forclient!!!!!!!!!!!!!!!!!!!' )
# add yum repo for latest puppet
  yumrepo { 'puppetlabs-pc1':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/7/PC1/$basearch',
    descr    => 'Puppet Labs PC1 Repository el 7 - $basearch',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
  }
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
  notice ('!!!!!!!!!!!!!!!finish class forclient!!!!!!!!!!!!!!!!!')
}
