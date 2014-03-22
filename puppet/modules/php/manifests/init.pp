class php {
    package { "php5-mysql":
        ensure  => "installed",
        require => Class["bootstrap"]
    }

    package { "php5-fpm":
        ensure  => "installed",
        require => Class["bootstrap"]
    }

    service { "php5-fpm":
        ensure => running,
        hasrestart => true,
        enable => true,
        require => Package["php5-fpm"],
    }

    file { "/etc/php5/fpm/php.ini":
        source => "puppet:///modules/php/php.ini",
        notify => Service["php5-fpm"],
        require => Package["php5-fpm"]
    }

    file { "/etc/php5/fpm/pool.d/www.conf":
        source => "puppet:///modules/php/www.conf",
        notify => Service["php5-fpm"],
        require => Package["php5-fpm"]
    }

    package { "phpunit":
        ensure  => "installed",
        require => Package["php5-fpm"]
    }

    exec { "upgrade pear":
        command => "pear upgrade pear",
        require => Package["phpunit"]
    }

    exec { "discover pear.phpunit.de":
        command => "pear channel-discover pear.phpunit.de",
        require => Exec["upgrade pear"]
    }

    exec { "discover components.ez.no":
        command => "pear channel-discover components.ez.no",
        require => Exec["discover pear.phpunit.de"]
    }

    exec { "discover pear.symfony-project.com":
        command => "pear channel-discover pear.symfony-project.com",
        require => Exec["discover components.ez.no"]
    }

    exec { "install all phpunit dependencies":
        command => "pear install --alldeps phpunit/PHPunit",
        require => Exec["discover pear.symfony-project.com"]
    }
}
