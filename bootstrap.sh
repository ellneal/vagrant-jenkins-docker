#!/usr/bin/env bash

# docker setup
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sh -c 'echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list'
apt-get install -y apt-transport-https; apt-get -y update
apt-get install -y docker-engine

# setup jenkins
useradd -u 8980 jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y update
sudo apt-get -y install jenkins

# add users to docker group
usermod -a -G docker vagrant
usermod -a -G docker jenkins

# restart jenkins
/etc/init.d/jenkins restart