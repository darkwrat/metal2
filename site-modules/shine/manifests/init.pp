class shine(
  Boolean $enable = true,
  String $createrepo_version = 'present',
) {

  package { 'createrepo' :
    ensure => $createrepo_version,
  }

  file { '/opt/shine' :
    ensure => 'directory',
  }->
  exec { '/usr/bin/createrepo --update /opt/shine' :
    refreshonly => true,
    require => Package['createrepo'],
  }->
  yumrepo { 'shine-local' :
    enabled => $enable,
    name => 'shine',
    baseurl => 'file:///opt/shine',
    gpgcheck => false,
  }

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
