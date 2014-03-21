class Virtualenvwrapper {

    exec { "install pip":
        command => "easy_install pip",
        require => Class["Python"]
    }

    exec { "upgrade setuptools":
        command => "pip install setuptools --no-use-wheel --upgrade",
        require => Exec["install pip"]
    }

    exec { "install virtualenv":
        command => "pip install virtualenv virtualenvwrapper",
        require => Exec["upgrade setuptools"]
    }

}
