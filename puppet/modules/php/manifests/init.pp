class php {
    package { "php5-cli":
        ensure  => "installed",
        require => Class["bootstrap"]
    }

    package { "php5-mysql":
        ensure  => "installed",
        require => Class["bootstrap"]
    }

    # Installing PHP5-FPM
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
}
