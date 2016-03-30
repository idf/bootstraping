#!/bin/bash
# credit: https://github.com/gzc
# dependencies: boostrap_scipy.sh
sudo -v

DEB_FILE=cdh5-repository_1.0_all.deb
wget http://archive.cloudera.com/cdh5/one-click-install/trusty/amd64/$DEB_FILE -O /tmp/$DEB_FILE
sudo dpkg -i /tmp/$DEB_FILE
rm -f /tmp/$DEB_FILE
sudo apt-get update
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk
sudo apt-get install -y spark-master spark-worker spark-python
