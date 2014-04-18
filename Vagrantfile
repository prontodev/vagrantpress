# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "pronto-vagrantpress"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.host_name = "vagrant"
  config.vm.network :private_network, ip: "123.123.12.12"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  #config.vm.provision :shell, :path => "puppet/bootstrap.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = "puppet/modules"
    puppet.options        = "--verbose --debug"
  end
end
