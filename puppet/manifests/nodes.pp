node 'vagrant' {
    include bootstrap
    #include python
    include mysql
    #include virtualenvwrapper
    include nginx
    include php
    include pear
}
