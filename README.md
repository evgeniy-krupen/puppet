# Exit task report
Student: [Evgeniy_Krupen](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038655484#emplTab=general)

1. I made [Vagrantfile](https://github.com/evgeniy-krupen/puppet/blob/master/Vagrantfile) with "sbeliakou/centos-7.2-x86_64" CentOS 7 image for exit task. Therefore I had already EPEL repo in image.

2. I used [puppet.sh](https://github.com/evgeniy-krupen/puppet/blob/master/puppet.sh) as provisioning by Vagrant.

3. I created 3 classes for exit task module: [init.pp(general class)](https://github.com/evgeniy-krupen/puppet/blob/master/exittask/manifests/init.pp), [formaster.pp (class for puppetserver)](https://github.com/evgeniy-krupen/puppet/blob/master/exittask/manifests/formaster.pp), [forclient(class for puppet agent)](https://github.com/evgeniy-krupen/puppet/blob/master/exittask/manifests/forclient.pp)

4. Custom fact used for logic in module.

5. Template used for autosign on puppetserver.

6. The last step was puppet lint. I examined my module.


***


# This is repo for final task 
## Final task
Provide single puppet module which can setup both puppet master and puppet agent current version from repositories which provided by puppetlabs for example - you delivery plan can be following:
  1. provision clear box with CentOS 7
  2. setup available puppet from CentOS repo
  3. Deliver all needed puppet code
  4. Apply your manifest with `puppet apply`
  
## Requirements

 1. Module should be able to setup correct set of repositories including signing keys
 2. Module should be able to make decision where it runs and understand when should be applied configuration for agent nodes and where for master node
 3. Puppet module should contain at least one custom fact for example `is_puppetmaster = true|false`
 4. Puppet module should contain erb tepmlates one or more
 5. Puppet module should be verified with puppet-lint and contains metadata.json
   5. Special task for getting maximal raiting: Add puppetdb and puppetdb explorer (https://github.com/dalen/puppetexplorer) configuration to part of your manifest which manages puppet server setup, both, puppetdb and puppetexplorer should be integrated, reports from agent should stores in puppetdb.
   6. Special Task 2: setup module management with r10k (https://github.com/puppetlabs/r10k) r10k basic setup should be done with puppet
   
##Defenition of done

 1. You have at least 2 VMs and can demostrate them, one is a puppet master and one is agent
 2. Your manifest can be applied locally on clear box and if you need predefines please ad them in documentation.
 3. Your code is available for review as pull request to this repository
 
###Dead Line 26.09.2016 8AM MSQ time zone
