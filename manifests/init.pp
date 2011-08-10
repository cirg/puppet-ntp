class ntp (
  $servers = [ '0.debian.pool.ntp.org', '1.debian.pool.ntp.org', '2.debian.pool.ntp.org', '3.debian.pool.ntp.org' ]
) {

  package { 'ntp':
    ensure => installed,
  }

  service { 'ntp':
    ensure  => running,
    require => Package['ntp'],
  }

  file { '/etc/ntp.conf':
    content => template('ntp/ntp.conf.erb'),
    require => Package['ntp'],
    notify  => Service['ntp'],
  }
}
