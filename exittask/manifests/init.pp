#
#
class exittask {
notice('the line below is variables is_puppetserver:')
notice($::is_puppetmaster)

if $::is_puppetmaster == 'true' {
  include exittask::formaster
}

else {
  include exittask::forclient
}

}
