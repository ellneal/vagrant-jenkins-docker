Vagrant.configure(2) do |config|
  config.vm.provider :virtualbox do
    unless Vagrant.has_plugin?("vagrant-vbguest")
      raise "The vagrant-vbguest plugin is not installed. Run `vagrant plugin install vagrant-vbguest` then try again."
    end
  end

  config.vm.box = "debian/jessie64"

  dockerfiles_dir = "/var/lib/dockerfiles"
  jenkins_dir = "/var/lib/jenkins"
  docker_sock_path = "/var/run/docker.sock"

  config.vm.provision "docker", images: ["jenkins:latest"] do |docker|
    docker.build_image dockerfiles_dir, args: "-f #{dockerfiles_dir}/jenkins_docker -t jenkins/docker --build-arg DOCKER_GROUP_ID=$(getent group docker | cut -d: -f3)"
    docker.run "jenkins/docker", args: "-p 8080:8080 -p 50000:50000 -v #{jenkins_dir}:#{jenkins_dir} -v #{docker_sock_path}:#{docker_sock_path} -v $(which docker):/usr/bin/docker"
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8980

  config.vm.synced_folder "./jenkins_home", jenkins_dir
  config.vm.synced_folder "./dockerfiles", dockerfiles_dir

  # disable the default share
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
