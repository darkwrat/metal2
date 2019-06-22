class rpmdev(
    String $rpmdevtools_version = 'present',
) {

  package { 'rpmdevtools' :
    ensure => $rpmdevtools_version,
  }->
  exec { '/usr/bin/rpmdev-setuptree' :
    user => 'root',
    environment => ["HOME=/root"],
    creates => '/root/rpmbuild',
  }

}
# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
