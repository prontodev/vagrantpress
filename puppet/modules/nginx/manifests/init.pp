class Nginx {

    $nginx_packages = [ "nginx" ]
    package { $nginx_packages:
        ensure  => "installed",
        require => Class["Bootstrap"]
    }

}
