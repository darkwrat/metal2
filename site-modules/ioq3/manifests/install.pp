class ioq3::install(
    String $version = 'present',
) {

  package { 'ioq3ded' :
    ensure => $version
  }

  Class['shine'] -> Class[$name]

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
