# Class: foreman::repository
#
# This class installs foreman repositories.
# Required for installation based on package
#
# == Variables
#
# Refer to foreman class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by foreman main class.
# This class uses default file and exec defines to avoid more
# Example42 dependencies (sigh)
#
class foreman::repository inherits foreman {

  case $::operatingsystem {

    redhat,centos,fedora,Scientific: {
      yumrepo {
        'foreman':
          descr    => 'Foreman stable repository',
          baseurl  => 'http://yum.theforeman.org/stable',
          gpgcheck => '0',
          enabled  => '1';
        'foreman-testing':
          descr    => 'Foreman testing repository',
          baseurl  => 'http://yum.theforeman.org/test',
          enabled  => '0',
          gpgcheck => '0',
      }
    }

    Debian,Ubuntu: {
      file { '/etc/apt/sources.list.d/foreman.list':
        content => "deb http://deb.theforeman.org/ stable main\n"
      }
      ~>
      exec { 'foreman-key':
        command     => '/usr/bin/wget -q http://deb.theforeman.org/foreman.asc -O- | /usr/bin/apt-key add -',
        refreshonly => true
      }
      ~>
      exec { 'update-apt':
        command     => '/usr/bin/apt-get update',
        refreshonly => true
      }
    }
    default: { fail("${::hostname}: This module does not support operatingsystem ${::operatingsystem}") }
  }
}
