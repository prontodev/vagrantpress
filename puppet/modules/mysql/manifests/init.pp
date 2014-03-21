class mysql {
    include mysql::install
    #, mysql::service, mysml::setupdb
}

class mysql::install {
    $mysql_packages = [ "mysql-server-5.5" ]
    package { $mysql_packages:
        ensure  => present,
        require => Class["bootstrap"]
    }
}

class mysql::service {
    service { "mysql":
        ensure => running,
        enable => true,
        require => Class["mysql::install"],
    }
}

#class Mysql::setupdb {
#    exec { "createuser":
#        command => "createuser -s -w prontoworld",
#        user => "postgres",
#        unless => "psql -c \"SELECT usename FROM pg_user WHERE usename = 'prontoworld';\" | grep prontoworld",
#        require => Class["Mysql::install"],
#    }
#
#    exec { "changepassword":
#        command => "psql -c \"ALTER USER prontoworld WITH PASSWORD 'Pr0nt0W0rld';\"",
#        user => "postgres",
#        unless => "psql -c \"SELECT usename FROM pg_user WHERE usename = 'prontoworld';\" | grep prontoworld",
#        require => Class["createuser"],
#    }
#
#    exec { "createdb":
#        command => "createdb -O prontoworld prontoworld",
#        user => "postgres",
#        unless => "psql -c \"SELECT datname FROM pg_database WHERE datname = 'prontoworld';\" | grep prontoworld",
#        require => Exec["createuser"],
#    }
#}
