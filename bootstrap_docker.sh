#!/bin/bash
codename=$(lsb_release --codename | cut -f2)
docker_list="/etc/apt/sources.list.d/docker.list"

sudo -v
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo touch $docker_list
sudo chmod 777 $docker_list
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-${codename} main" > $docker_list

sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y docker-engine
