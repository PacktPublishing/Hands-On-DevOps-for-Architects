#init.pp

class lampserver {
  #apt-get Update is required before other updates are applied
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }
  #Install apache2
  package { 'apache2':
    require => Exec['apt-update'],
    ensure => installed,
  }
  #ensure that the apache2 service is running
  service { 'apache2':
    ensure => running,
  }
  # install php5
  package { 'php5':
    require => Exec['apt-update'],
    ensure => installed,
  }
  # create the /var/www/html/info.php file
  file { '/var/www/html/info.php':
    ensure => file,
    content => '<?php  phpinfo(); ?>',
    require => Package['apache2'],
  }
