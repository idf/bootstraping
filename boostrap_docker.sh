#!/bin/bash
#:param: ubuntu version

if [[ $# -eq 0 ]] ; then
  echo 'Error: Please enter ubuntu version code name (e.g. vivid; precise; trusty)'
  exit 0
fi

sudo -v
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-$1 main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update

sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install docker-engine
