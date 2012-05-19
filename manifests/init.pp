# = Class: foreman
#
# This is the main foreman class
#
#
# == Parameters
#
# Module specific parameters
#
# [*url*]
#   URL to access theforeman web application
#
# [*puppet_server*]
#   Hostname of the puppet server to talk to
#
# [*puppet_config_dir*]
#   Path to the configuration directory of puppet
#
# [*puppet_data_dir*]
#   Path to the data directory of Puppet
#
# [*puppet_modules_dir*]
#   Path to the modules directory of Puppet
#
# [*puppet_config_file_owner*]
#   Owner of Puppet configuration files
#
# [*puppet_config_file_group*]
#   Group owner of Puppet configuration files
#
# [*bindaddress*]
#   IP address theforeman will listen to
#
# [*environments*]
#   Names of the environments managed by foreman
#
# [*enc*]
#   Should foreman act as an external node classifier
#   (manage puppet class assignments)
#
# [*reports*]
#   Should foreman receive reports from puppet
#
# [*facts*]
#   Should foreman recive facts from puppet
#
# [*storeconfigs*]
#   Do you use storeconfig (and run foreman on the same database) ?
#   (note: not required)
#
# [*unattended*]
#   should foreman manage host provisioning as well
#
# [*authentication*]
#   Enable users authentication (default user:admin pw:changeme)
#
# [*passenger*]
#   configure foreman via apache and passenger
#
# [*ssl*]
#   force SSL (note: requires passenger)
#
# [*db*]
#   Type of database to use : sqlite, mysql, postgresql
#
# [*db_name*]
#   Name of the database to use
#
# [*db_server*]
#   Name of the server storing the database
#
# [*db_user*]
#   User to use to connect to the database server
#
# [*db_password*]
#   Password to use to connect to the database server
#
# [*db_path*]
#   Path of the database file when using a SQLite database
#
# [*db_root_user*]
#   Super-user of the database server to connect to.
#   Used to create tables
#
# [*db_root_password*]
#   Password of the super-user of the database server to connect to.
#   Used to create tables
#
# [*db_mysql_package*]
#   Name of the package to install to use a MySQL database
#
# [*db_postgresql_package*]
#   Name of the package to install to use a PostgreSQL database
#
# [*db_sqlite_package*]
#   Name of the package to install to use a SQLite database
#
# [*basedir*]
#   Basedir of theforeman web application
#
# [*template_database*]
#   Path to the template of the database configuration file
#
# [*template_enc*]
#   Path to the template of the ENC script
#
# [*template_passenger*]
#   Path to the template of the passenger vhost configuration file
#
# [*template_reports*]
#   Path to the template of reports script
#
# [*script_file_mode*]
#   Rights to set on script files
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, foreman class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $foreman_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, foreman main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $foreman_source
#
# [*source_dir*]
#   If defined, the whole foreman configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $foreman_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $foreman_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, foreman main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $foreman_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $foreman_options
#
# [*service_autorestart*]
#   Automatically restarts the foreman service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $foreman_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $foreman_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $foreman_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $foreman_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for foreman checks
#   Can be defined also by the (top scope) variables $foreman_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $foreman_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $foreman_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $foreman_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $foreman_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for foreman port(s)
#   Can be defined also by the (top scope) variables $foreman_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling foreman. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $foreman_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $foreman_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $foreman_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $foreman_audit_only
#   and $audit_only
#
# Default class params - As defined in foreman::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of foreman package
#
# [*service*]
#   The name of foreman service
#
# [*service_status*]
#   If the foreman service init script supports status argument
#
# [*process*]
#   The name of foreman process
#
# [*process_args*]
#   The name of foreman arguments. Used by puppi and monitor.
#   Used only in case the foreman process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user foreman runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $foreman_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $foreman_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include foreman"
# - Call foreman as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class foreman (
  $url                      = params_lookup( 'url' ),
  $puppet_server            = params_lookup( 'puppet_server' ),
  $puppet_config_dir        = params_lookup( 'puppet_config_dir' ),
  $puppet_modules_dir       = params_lookup( 'puppet_modules_dir' ),
  $puppet_data_dir          = params_lookup( 'puppet_data_dir' ),
  $puppet_config_file_owner = params_lookup( 'puppet_config_file_owner' ),
  $puppet_config_file_group = params_lookup( 'puppet_config_file_group' ),
  $bindaddress              = params_lookup( 'bindaddress' ),
  $environments             = params_lookup( 'environments' ),
  $enc                      = params_lookup( 'enc' ),
  $reports                  = params_lookup( 'reports' ),
  $facts                    = params_lookup( 'facts' ),
  $storeconfigs             = params_lookup( 'storeconfigs' ),
  $unattended               = params_lookup( 'unattended' ),
  $authentication           = params_lookup( 'authentication' ),
  $passenger                = params_lookup( 'passenger' ),
  $ssl                      = params_lookup( 'ssl' ),
  $db                       = params_lookup( 'db' ),
  $db_name                  = params_lookup( 'db_name' ),
  $db_server                = params_lookup( 'db_server' ),
  $db_user                  = params_lookup( 'db_user' ),
  $db_password              = params_lookup( 'db_password' ),
  $db_path                  = params_lookup( 'db_path' ),
  $db_root_user             = params_lookup( 'db_root_user' ),
  $db_root_password         = params_lookup( 'db_root_password' ),
  $db_mysql_package         = params_lookup( 'db_mysql_package' ),
  $db_postgresql_package    = params_lookup( 'db_postgresql_package' ),
  $db_sqlite_package        = params_lookup( 'db_sqlite_package' ),
  $basedir                  = params_lookup( 'basedir' ),
  $preseed_file             = params_lookup( 'preseed_file' ),
  $template_database        = params_lookup( 'template_database' ),
  $template_enc             = params_lookup( 'template_enc' ),
  $template_preseed         = params_lookup( 'template_preseed' ),
  $template_passenger       = params_lookup( 'template_passenger' ),
  $template_reports         = params_lookup( 'template_reports' ),
  $script_file_mode         = params_lookup( 'script_file_mode' ),
  $my_class                 = params_lookup( 'my_class' ),
  $source                   = params_lookup( 'source' ),
  $source_dir               = params_lookup( 'source_dir' ),
  $source_dir_purge         = params_lookup( 'source_dir_purge' ),
  $template                 = params_lookup( 'template' ),
  $service_autorestart      = params_lookup( 'service_autorestart' , 'global' ),
  $options                  = params_lookup( 'options' ),
  $version                  = params_lookup( 'version' ),
  $absent                   = params_lookup( 'absent' ),
  $disable                  = params_lookup( 'disable' ),
  $disableboot              = params_lookup( 'disableboot' ),
  $monitor                  = params_lookup( 'monitor' , 'global' ),
  $monitor_tool             = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target           = params_lookup( 'monitor_target' , 'global' ),
  $puppi                    = params_lookup( 'puppi' , 'global' ),
  $puppi_helper             = params_lookup( 'puppi_helper' , 'global' ),
  $firewall                 = params_lookup( 'firewall' , 'global' ),
  $firewall_tool            = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src             = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst             = params_lookup( 'firewall_dst' , 'global' ),
  $debug                    = params_lookup( 'debug' , 'global' ),
  $audit_only               = params_lookup( 'audit_only' , 'global' ),
  $package                  = params_lookup( 'package' ),
  $service                  = params_lookup( 'service' ),
  $service_status           = params_lookup( 'service_status' ),
  $process                  = params_lookup( 'process' ),
  $process_args             = params_lookup( 'process_args' ),
  $process_user             = params_lookup( 'process_user' ),
  $config_dir               = params_lookup( 'config_dir' ),
  $config_file              = params_lookup( 'config_file' ),
  $config_file_mode         = params_lookup( 'config_file_mode' ),
  $config_file_owner        = params_lookup( 'config_file_owner' ),
  $config_file_group        = params_lookup( 'config_file_group' ),
  $config_file_init         = params_lookup( 'config_file_init' ),
  $pid_file                 = params_lookup( 'pid_file' ),
  $data_dir                 = params_lookup( 'data_dir' ),
  $log_dir                  = params_lookup( 'log_dir' ),
  $log_file                 = params_lookup( 'log_file' ),
  $port                     = params_lookup( 'port' ),
  $protocol                 = params_lookup( 'protocol' )
  ) inherits foreman::params {

  $bool_enc=any2bool($enc)
  $bool_reports=any2bool($reports)
  $bool_facts=any2bool($facts)
  $bool_storeconfigs=any2bool($storeconfigs)
  $bool_unattended=any2bool($unattended)
  $bool_authentication=any2bool($authentication)
  $bool_passenger=any2bool($passenger)
  $bool_ssl=any2bool($ssl)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $foreman::bool_absent ? {
    true  => 'absent',
    false => $foreman::version,
  }

  $manage_service_enable = $foreman::bool_disableboot ? {
    true    => false,
    default => $foreman::bool_disable ? {
      true    => false,
      default => $foreman::bool_absent ? {
        true  => false,
        false => $foreman::bool_passenger ? {
          true  => false,
          false => true,
        },
      },
    },
  }

  $manage_service_ensure = $foreman::bool_disable ? {
    true    => 'stopped',
    default =>  $foreman::bool_absent ? {
      true    => 'stopped',
      default => $foreman::bool_passenger ? {
        true  => 'stopped',
        false => 'running',
      },
    },
  }

  $manage_service_autorestart = $foreman::bool_service_autorestart ? {
    true    => Service[foreman],
    false   => undef,
  }

  $manage_file = $foreman::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $foreman::bool_absent == true
  or $foreman::bool_disable == true
  or $foreman::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $foreman::bool_absent == true
  or $foreman::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $foreman::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $foreman::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $foreman::source ? {
    ''        => undef,
    default   => $foreman::source,
  }

  $manage_file_content = $foreman::template ? {
    ''        => template('foreman/settings.yaml.erb'),
    default   => template($foreman::template),
  }

  $manage_file_database_content = $foreman::template_database ? {
    ''        => template('foreman/database.yml.erb'),
    default   => template($foreman::template_database),
  }

  $manage_file_enc_content = $foreman::template_enc ? {
    ''        => template('foreman/external_node.rb.erb'),
    default   => template($foreman::template_enc),
  }

  $manage_file_preseed_content = $foreman::template_preseed ? {
    ''        => template('foreman/foreman.seeds.erb'),
    default   => template($foreman::template_preseed),
  }

  $manage_file_passenger_path = $foreman::template_passenger ? {
    ''        => 'foreman/foreman-passenger.conf.erb',
    default   => $foreman::template_passenger,
  }

  $manage_file_reports_content = $foreman::template_reports ? {
    ''        => template('foreman/foreman-report.rb.erb'),
    default   => template($foreman::template_reports),
  }

  ### Managed resources
  file { 'foreman.seeds':
    ensure  => $foreman::manage_file,
    path    => $foreman::preseed_file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => $foreman::manage_file_preseed_content,
    replace => $foreman::manage_file_replace,
    audit   => $foreman::manage_audit,
  }

  require foreman::repository
  package { 'foreman':
    ensure       => $foreman::manage_package,
    name         => $foreman::package,
    responsefile => $foreman::preseed_file,
    require      => File['foreman.seeds'],
  }

  case $foreman::db {
    mysql: {
      package { 'foreman-db':
        ensure  => $foreman::manage_package,
        name    => $foreman::db_mysql_package,
      }
    }
    postgresql: {
      package { 'foreman-db':
        ensure  => $foreman::manage_package,
        name    => $foreman::db_postgresql_package,
      }
    }
    default: {
      package { 'foreman-db':
        ensure  => $foreman::manage_package,
        name    => $foreman::db_sqlite_package,
      }
    }
  }

  service { 'foreman':
    ensure     => $foreman::manage_service_ensure,
    name       => $foreman::service,
    enable     => $foreman::manage_service_enable,
    hasstatus  => $foreman::service_status,
    pattern    => $foreman::process,
    require    => Package['foreman', 'foreman-db'],
  }

  file { 'settings.yaml':
    ensure  => $foreman::manage_file,
    path    => $foreman::config_file,
    mode    => $foreman::config_file_mode,
    owner   => $foreman::config_file_owner,
    group   => $foreman::config_file_group,
    require => Package['foreman'],
    notify  => $foreman::manage_service_autorestart,
    source  => $foreman::manage_file_source,
    content => $foreman::manage_file_content,
    replace => $foreman::manage_file_replace,
    audit   => $foreman::manage_audit,
  }

  file { 'database.yml':
    ensure  => $foreman::manage_file,
    path    => "${foreman::config_dir}/database.yml",
    mode    => $foreman::config_file_mode,
    owner   => $foreman::config_file_owner,
    group   => $foreman::config_file_group,
    require => Package['foreman'],
    notify  => $foreman::manage_service_autorestart,
    content => $foreman::manage_file_database_content,
    replace => $foreman::manage_file_replace,
    audit   => $foreman::manage_audit,
  }

  # The whole foreman configuration directory can be recursively overriden
  if $foreman::source_dir {
    file { 'foreman.dir':
      ensure  => directory,
      path    => $foreman::config_dir,
      require => Package['foreman'],
      notify  => $foreman::manage_service_autorestart,
      source  => $foreman::source_dir,
      recurse => true,
      purge   => $foreman::source_dir_purge,
      replace => $foreman::manage_file_replace,
      audit   => $foreman::manage_audit,
    }
  }

  # ENC / Facts
  if $foreman::bool_enc == true
  or ($foreman::bool_facts == true and $foreman::bool_storeconfigs == false) {
    file { 'node.rb':
      ensure  => $foreman::manage_file,
      path    => "${foreman::puppet_config_dir}/node.rb",
      mode    => $foreman::script_file_mode,
      owner   => $foreman::puppet_config_file_owner,
      group   => $foreman::puppet_config_file_group,
      require => Package['foreman'],
      notify  => $foreman::manage_service_autorestart,
      content => $foreman::manage_file_enc_content,
      replace => $foreman::manage_file_replace,
      audit   => $foreman::manage_audit,
    }

    # ensure directories ${foreman::puppet_data_dir}/yaml
    # and ${foreman::puppet_data_dir}/yaml/foreman : puppet/puppet ; 640
  }

  # Reports
  if $foreman::bool_reports == true {
    file { 'foreman.rb':
      ensure  => $foreman::manage_file,
      path    => '/usr/lib/ruby/1.8/puppet/reports/foreman.rb',
      mode    => $foreman::config_file_mode,
      owner   => $foreman::puppet_config_file_owner,
      group   => $foreman::puppet_config_file_group,
      require => Package['foreman'],
      notify  => $foreman::manage_service_autorestart,
      content => $foreman::manage_file_reports_content,
      replace => $foreman::manage_file_replace,
      audit   => $foreman::manage_audit,
    }
  }

  # Unattended
  if $foreman::bool_unattended == true {
    # TODO
  }

  # Auth
  if $foreman::bool_authentication == true {
    #TODO
  }

  # Passenger / SSL
  if $foreman::bool_passenger == true {
    include foreman::passenger
  }

  # Storeconfigs
  if $foreman::bool_storeconfigs == true {
    exec{ 'db-migrate':
      command     => '/usr/bin/rake RAILS_ENV=production db:migrate',
      cwd         => $foreman::basedir,
      require     => Service['foreman'],
      subscribe   => Package['foreman'],
      refreshonly => true,
    }
  }


  ### Include custom class if $my_class is set
  if $foreman::my_class {
    include $foreman::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $foreman::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'foreman':
      ensure    => $foreman::manage_file,
      variables => $classvars,
      helper    => $foreman::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $foreman::bool_monitor == true {
    monitor::port { "foreman_${foreman::protocol}_${foreman::port}":
      protocol => $foreman::protocol,
      port     => $foreman::port,
      target   => $foreman::monitor_target,
      tool     => $foreman::monitor_tool,
      enable   => $foreman::manage_monitor,
    }
    monitor::process { 'foreman_process':
      process  => $foreman::process,
      service  => $foreman::service,
      pidfile  => $foreman::pid_file,
      user     => $foreman::process_user,
      argument => $foreman::process_args,
      tool     => $foreman::monitor_tool,
      enable   => $foreman::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $foreman::bool_firewall == true {
    firewall { "foreman_${foreman::protocol}_${foreman::port}":
      source      => $foreman::firewall_src,
      destination => $foreman::firewall_dst,
      protocol    => $foreman::protocol,
      port        => $foreman::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $foreman::firewall_tool,
      enable      => $foreman::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $foreman::bool_debug == true {
    file { 'debug_foreman':
      ensure  => $foreman::manage_file,
      path    => "${settings::vardir}/debug-foreman",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
