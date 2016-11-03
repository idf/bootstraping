#!/usr/bin/env bash
# https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-ubuntu-16-04-lts#step-3-%13-use-ubuntu's-do-release-upgrade-tool-to-perform-upgrade
sudo -v
sudo apt-get update
sudo apt-get upgrade

sudo apt-get dist-upgrade
sudo apt-get install -y update-manager-core

# do update
sudo do-release-upgrade
