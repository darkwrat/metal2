class mtproxy::install(
    String $version = 'present',
) {

  package { 'mtproxy' :
    ensure => $version
  }

  Class['shine'] -> Class[$name]

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
