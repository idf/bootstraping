#!/bin/bash

sudo -v
sudo easy_install numpy
sudo apt-get -y build-dep python-scipy
sudo pip install scipy
sudo pip install ipython[all]
sudo apt-get install -y libfreetype6-dev libpng-dev
sudo pip install -y matplotlib
sudo apt-get install -y pandoc
sudo pip install sklearn
