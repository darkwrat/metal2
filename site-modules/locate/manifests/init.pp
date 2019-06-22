class locate(
    String $mlocate_version = 'present',
) {

  package { 'mlocate' :
    ensure => $mlocate_version,
  }->
  exec { '/usr/bin/updatedb' :
    user    => 'root',
    creates => '/var/lib/mlocate/mlocate.db',
  }

}
# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
