# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.ssh.forward_agent = true

    config.vm.network :forwarded_port, guest: 5984, host: 5984
    config.vm.network :forwarded_port, guest: 6007, host: 6007
    config.vm.network :forwarded_port, guest: 6008, host: 6008
    config.vm.network :forwarded_port, guest: 6009, host: 6009

    config.vm.synced_folder ".", "/opt/project"
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "project.pp"
    end
end
