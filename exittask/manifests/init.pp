class exittask {
if $::hostname == 'puppet' {
  include exittask::formaster
}

else {
  include exittask::forclient
}

}
