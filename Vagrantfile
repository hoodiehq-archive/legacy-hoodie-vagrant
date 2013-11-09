# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define :hoodie_vagrant do |hoodie_vagrant|

        hoodie_vagrant.vm.box = "precise64"
        hoodie_vagrant.vm.box_url = "http://files.vagrantup.com/precise64.box"

        hoodie_vagrant.ssh.forward_agent = true

        hoodie_vagrant.vm.network :forwarded_port, guest: 5984, host: 5985
        hoodie_vagrant.vm.network :forwarded_port, guest: 6001, host: 6001
        hoodie_vagrant.vm.network :forwarded_port, guest: 6002, host: 6002
        hoodie_vagrant.vm.network :forwarded_port, guest: 6003, host: 6003
        hoodie_vagrant.vm.synced_folder ".", "/opt/project"
        hoodie_vagrant.vm.provision :puppet do |puppet|
            puppet.manifests_path = "manifests"
            puppet.manifest_file  = "project.pp"
            puppet.options = [
                '--verbose',
                '--debug',
            ]
        end

    end

end
