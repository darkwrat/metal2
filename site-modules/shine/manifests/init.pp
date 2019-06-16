class shine(
  Boolean $enable = true,
) {

  yumrepo { 'shine-local' :
    enabled => $enable,
    name => 'shine',
    baseurl => 'file:///opt/shine',
    gpgcheck => false,
  }

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
