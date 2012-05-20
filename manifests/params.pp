# Class: foreman::params
#
# This class defines default parameters used by the main module class foreman
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to foreman class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class foreman::params {

  ### Module's specific variables

  $url = "http://${::fqdn}"

  # Perhaps this should be $puppet::params::server ?
  $puppet_server = "puppet.$::domain"

  # Perhaps this should be $puppet::params::config_dir ?
  $puppet_config_dir = '/etc/puppet'

  $puppet_modules_dir = '/etc/puppet/modules'

  # Perhaps this should be $puppet::params::data_dir ?
  $puppet_data_dir = '/var/lib/puppet'

  # Perhaps this should be $puppet::params:config_file_owner ?
  $puppet_config_file_owner = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'puppet',
    default                   => 'root',
  }

  # Perhaps this should be $puppet::params:config_file_group ?
  $puppet_config_file_group = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'puppet',
    default                   => 'root',
  }

  $bindaddress = '0.0.0.0'

  $environments = 'production'

  # Perhaps this should be $puppet::params::nodetool == 'foreman' ?
  $enc = true

  $reports = true

  $facts = true

  # Perhaps this should be $puppet::params::storeconfigs ?
  $storeconfigs = false

  $unattended = false

  $authentication = false

  # Perhaps this should be $puppet::params::passenger ?
  $passenger = false

  $ssl = true

  # Perhaps this should be $puppet::params::db ?
  $db = 'sqlite'

  $db_name = 'foreman'

  # Perhaps this should be $puppet::params::db_server ?
  $db_server = ''

  $db_user = ''

  $db_password = ''

  $db_path = ''

  $db_root_user = 'root'

  $db_root_password = ''

  $db_mysql_package = $::operatingsystem ? {
    default => 'foreman-mysql',
  }

  $db_postgresql_package = $::operatingsystem ? {
    default => 'foreman-postgresql',
  }

  $db_sqlite_package = $::operatingsystem ? {
    default => 'foreman-sqlite3',
  }

  $basedir = $::operatingsystem ? {
    default => '/usr/share/foreman',
  }

  $preseed_file = '/var/cache/debconf/foreman.seeds'

  $template_database = ''

  $template_enc = ''

  $template_preseed = ''

  $template_passenger = ''

  $template_reports = ''

  $script_file_mode = $::operatingsystem ? {
    default => '0550',
  }

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'foreman',
  }

  $service = $::operatingsystem ? {
    default => 'foreman',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'foreman',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'foreman',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/foreman',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/foreman/settings.yaml',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'foreman',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/foreman',
    default                   => '/etc/sysconfig/foreman',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/foreman.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/foreman',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/foreman',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/foreman/production.log',
  }

  $port = '3000'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
