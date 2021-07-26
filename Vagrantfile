# -*- mode: ruby -*-
# vi: set ft=ruby :
HOSTNAME=File.basename(Dir::pwd)

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vagrant.plugins = ["vagrant-vbguest", "vagrant-reload"]

  # Common settings
  #config.dns.tld = "vagrant.dev"
  config.vm.box = "bento/centos-7"
  config.vm.box_check_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vbguest.auto_update = false
  config.ssh.forward_x11 = true
  [ "virtualbox", "parallels" ].each do |provider|
    config.vm.provider "#{provider}" do |p|
      p.memory=4096
      p.cpus=2
	  #p.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  # Dot files
  [
    ".gitconfig",
    ".git_global_ignores",
    ".bash_aliases",
    #".vimrc",
    #".vim",
    ".mongorc.js",
  ]
  .each do |dotfile|
    name="~/#{dotfile}"
    if File.exists?(File.expand_path(name))
      config.vm.provision "file", source: "#{name}", destination: "#{name}"
    end
  end

  config.vm.define HOSTNAME, autostart:false do |server|
    [ "virtualbox", "parallels"] .each do |provider|
      config.vm.provider "#{provider}" do |p|
        p.name = HOSTNAME
      end
    end
    server.vm.hostname = HOSTNAME
    server.vm.provision :shell, path: "bootstrap.sh", name: "Configure VM"
    #config.vm.provision :reload 
    #server.vm.provision :shell, path: "personalize.sh", name: "Personalize"
  end

end
