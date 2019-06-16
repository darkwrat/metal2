class mtproxy::miscellaneous(
  String $secret_url = 'https://core.telegram.org/getProxySecret',
  String $config_url = 'https://core.telegram.org/getProxyConfig',
) {

  file { '/usr/local/mtproxy/misc' :
    ensure => 'directory',
    recurse => true,
  }

  exec { "/usr/bin/curl -s \"${secret_url}\" -o /usr/local/mtproxy/misc/proxy-secret" :
    creates => '/usr/local/mtproxy/misc/proxy-secret',
  }

  $curl_config = "/usr/bin/curl -s \"${config_url}\" -o /usr/local/mtproxy/misc/proxy-config"

  exec { $curl_config :
    creates => '/usr/local/mtproxy/misc/proxy-config',
  }

  cron { 'mtproxy-config':
    command => $curl_config,
    user => 'root',
    hour => 2,
    minute => 0,
  }

  Class[mtproxy::install] -> Class[$name]

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab
