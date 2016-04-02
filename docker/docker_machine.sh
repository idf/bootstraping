#!/bin/bash
# https://docs.docker.com/machine/install-machine/
# Docker Machine is a tool for provisioning and managing your Dockerized hosts (hosts with Docker Engine on them). Typically Docker Engine is running on ubuntu VM on OSX or windows. Another use is for docker swarm managing clusters.
sudo su <<EOF
  curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine && \
  chmod +x /usr/local/bin/docker-machine
EOF
