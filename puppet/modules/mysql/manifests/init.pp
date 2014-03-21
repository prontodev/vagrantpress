class Mysql {
    include Mysql::install, Mysql::service, Mysql::setupdb
}

class Mysql::install {
    $postgres_packages = [ "mysql-9.1", "libpq-dev" ]
    package { $postgres_packages:
        ensure  => present,
        require => Class["bootstrap"]
    }
}

class Mysql::service {
    service { "Mysql":
        ensure => running,
        enable => true,
        require => Class["Mysql::install"],
    }
}

class Mysql::setupdb {
    exec { "createuser":
        command => "createuser -s -w prontoworld",
        user => "postgres",
        unless => "psql -c \"SELECT usename FROM pg_user WHERE usename = 'prontoworld';\" | grep prontoworld",
        require => Class["Mysql::install"],
    }

    exec { "changepassword":
        command => "psql -c \"ALTER USER prontoworld WITH PASSWORD 'Pr0nt0W0rld';\"",
        user => "postgres",
        unless => "psql -c \"SELECT usename FROM pg_user WHERE usename = 'prontoworld';\" | grep prontoworld",
        require => Class["createuser"],
    }

    exec { "createdb":
        command => "createdb -O prontoworld prontoworld",
        user => "postgres",
        unless => "psql -c \"SELECT datname FROM pg_database WHERE datname = 'prontoworld';\" | grep prontoworld",
        require => Exec["createuser"],
    }
}
