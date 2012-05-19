#
# Class foreman::passenger
#
# Installs and configures passenger for Foreman
#
class foreman::passenger {
  require foreman

  case $::operatingsystem {
    centos: { require yum::repo::passenger }
    redhat: { require yum::repo::passenger }
    default: { }
  }

  include apache::ssl
  include apache::passenger

  file { "${foreman::basedir}/config.ru":
    ensure => link,
    owner  => $foreman::process_user,
    target => "${foreman::basedir}/vendor/rails/railties/dispatches/config.ru",
  }

  file { "${foreman::basedir}/config/environment.rb":
    owner   => $foreman::process_user,
    require => Class['foreman'],
  }

  apache::vhost { 'foreman':
    port     => '80',
    priority => '20',
    docroot  => "${foreman::basedir}/public/",
    ssl      => true,
    template => $foreman::manage_file_passenger_path,
  }

}
