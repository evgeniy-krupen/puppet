#! /bin/bash
# this is script for web VM
yum install -y puppet
#rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
#puppet apply /vagrant/puppet/exittask/manifest/init.pp
echo "copy files"
#cp -R /vagrant/puppet/exittask/ /root
puppet apply -e 'include exittask' --modulepath=/vagrant/puppet/
