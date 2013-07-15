# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.ssh.forward_agent = true

    config.vm.network :forwarded_port, guest: 5984, host: 5985
    config.vm.network :forwarded_port, guest: 6001, host: 6001
    config.vm.network :forwarded_port, guest: 6002, host: 6002
    config.vm.network :forwarded_port, guest: 6003, host: 6003

    config.vm.synced_folder ".", "/opt/project"
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "project.pp"
        puppet.options = [
            '--verbose',
            '--debug',
        ]
    end
end
