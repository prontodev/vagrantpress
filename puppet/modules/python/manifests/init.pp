class python {

    $python_packages = [ "python2.7", "python2.7-dev", "python-setuptools" ]
    package { $python_packages:
        ensure  => "installed",
        require => Class["bootstrap"]
    }

}
