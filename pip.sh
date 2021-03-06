#!/usr/bin/env bash

# Install both pip and pip3
sudo -v
if !(hash pip 2>/dev/null); then
    echo "installing pip"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python get-pip.py
    sudo python3 get-pip.py  # using python3
    rm get-pip.py
fi
