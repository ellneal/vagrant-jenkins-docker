unless Vagrant.has_plugin?("vagrant-vbguest")
  raise <<-eos
  

The vagrant-vbguest plugin is not installed
Run `vagrant plugin install vagrant-vbguest` then try again
  eos
end

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network "forwarded_port", guest: 8080, host: 8980

  # create the jenkins share
  # the jenkins user is fixed to uid=8980 during provisioning
  config.vm.synced_folder "./jenkins_home", "/var/lib/jenkins", mount_options: ["uid=8980"]

  # disable the default share
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
