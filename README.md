# Vagrant + Jenkins + Docker

This script will setup a VM that has [jenkins][jenkins] and [docker][docker] preinstalled and configured. While the VM is running jenkins will be available on localhost:8980.

[jenkins]: https://jenkins-ci.org
[docker]: https://www.docker.com

### Setup

Simply clone this repository and `cd` into the directory. Make sure you have vagrant and [VirtualBox][virtualbox] installed, and the `vagrant-vbguest` plugin is available. Then run `vagrant up`.

```bash
$ cd path/to/repository
$ vagrant plugin install vagrant-vbguest
$ vagrant up
```

[virtualbox]: https://www.virtualbox.org

### Jenkins Persistence

Jenkins will persist to the filesystem, which is setup as a shared folder named `jenkins_home`. You can safely destroy the virtual machine without losing any of your work inside jenkins.