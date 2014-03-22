class mysql {
    include mysql::install, mysql::service, mysql::setupdb
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

class mysql::setupdb {
    exec { "createdb-dev":
        unless => "mysql -u root bypronto",
        command => "mysql -u root -e \"create database bypronto;\"",
        require => Class["mysql::service"],
    }

    exec { "createdb-test":
        unless => "mysql -u root bypronto_test",
        command => "mysql -u root -e \"create database bypronto_test;\"",
        require => Class["mysql::service"],
    }
}
