#! /bin/bash
# this is script for web VM
yum install -y puppet
echo "copy files"
puppet apply -e 'include exittask' --modulepath=/vagrant/puppet/
