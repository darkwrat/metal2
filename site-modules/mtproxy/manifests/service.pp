class mtproxy::service(
    Boolean $enable = true,
    String $ensure = 'running',
    Integer $port = 8002,
    Integer $stats_port = 8012,
    Sensitive[String] $proxy_secret,
    Sensitive[String] $proxy_tag,
) {

  file { '/usr/lib/systemd/system/mtproxy.service' :
    ensure  => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('mtproxy/mtproxy.service.erb'),
  }~>
  service { 'mtproxy' :
    ensure => $ensure,
    enable => $enable,
    hasstatus  => true,
    hasrestart => true,
    pattern => '/usr/local/mtproxy/bin/mtproto-proxy',
  }

  firewall { '100 mtproxy' :
    dport => 8002,
    proto => tcp,
    action => accept,
    before => Service['mtproxy'],
  }

  exec { 'systemctl daemon-reload' :
    refreshonly => true,
    command => '/usr/bin/systemctl daemon-reload',
    before => Service['mtproxy'],
    subscribe => File['/usr/lib/systemd/system/mtproxy.service'],
  }

  Class['mtproxy::install'] -> Class[$name]
  Class['mtproxy::miscellaneous'] -> Class[$name]

  Class['mtproxy::install'] ~> Class[$name]

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
