Package  { ensure => latest, }
Exec {
     user   => root,
     path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin"],
     logoutput => "on_failure",
}

class base {
  exec {"update":
    command => "/usr/bin/apt-get update"
  }

  file { "/home/vagrant/.bash_login":
    content => "cd /opt/project",
  }

  package { "pre-deps":
    name => [
      "python-software-properties",
      "git",
      "curl"
    ],
    require => Exec["update"],
  }

  exec {"nodejs-ppa":
    command => "/usr/bin/apt-add-repository ppa:chris-lea/node.js && apt-get update",
    user => root,
    creates => "/etc/apt/sources.list.d/chris-lea-node_js-precise.list",
    require => Package["pre-deps"],
  }

  exec {"couchdb-ppa":
    command => "/usr/bin/add-apt-repository ppa:longsleep/couchdb && apt-get update",
    user => root,
    creates => "/etc/apt/sources.list.d/chris-lea-node_js-precise.list",
    require => Package["pre-deps"],
  }

  package { "deps":
    name => ["nodejs", "couchdb"],
    ensure => present,
    require => Exec["nodejs-ppa", "couchdb-ppa"],
  }

  service { "couchdb":
    ensure  => "running",
    enable  => "true",
    require => Package["deps"],
  }

  file { "/etc/couchdb/local.ini":
    ensure  => "present",
    owner => "couchdb",
    group => "couchdb",
    mode => "600",
    content => template('/opt/project/manifests/local.ini.erb'),
    require => Package["deps"],
    notify  => Service["couchdb"]
  }
}

class packages {
  exec { "npm-install-g":
    cwd => "/opt/project",
    command => "/usr/bin/npm install -g hoodie-cli",
    user => root,
    require => Class['base']
  }

  # activate this if you want your app dependencies installed
  # exec { "npm-install":
  #   command => "/usr/bin/npm install",
  #   cwd => "/opt/project",
  #   require => Exec["npm-install-g"]
  # }
}

include base
include packages
