#!/usr/bin/env bash
sudo -v

sudo add-apt-repository ppa:ultradvorka/ppa  # for hh
apt-get update
sudo apt-get install -y git
sudo apt-get install -y python-pip  # may use bootstrap_pip.sh to get the latest
sudo apt-get install -y emacs --with-gnutls
sudo apt-get install -y python-dev
sudo apt-get install -y git-svn
sudo apt-get install -y texinfo
sudo apt-get install -y tree
sudo apt-get install -y hh
