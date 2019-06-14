class sysctl {

  $sysctls = lookup('sysctl', Hash, 'deep')

  file { '/etc/sysctl.conf' :
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('sysctl/sysctl.conf.erb'),
  }

  exec { 'sysctl' :
    command => "/usr/sbin/sysctl -p",
    subscribe => File['/etc/sysctl.conf'],
    refreshonly => true,
  }

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
