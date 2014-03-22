class nginx {
    package { "nginx":
        ensure  => "installed",
        require => Class["bootstrap"]
    }

    service { "nginx":
        ensure => running,
        enable => true,
        hasrestart => true,
        require => Package["nginx"],
    }

    file { "/etc/nginx/sites-available/default":
        source => "puppet:///modules/nginx/default",
        notify => Service["nginx"],
        require => Package["nginx"]
    }
}
