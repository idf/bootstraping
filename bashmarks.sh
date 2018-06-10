#!/usr/bin/env bash
sudo -v
if [ ! -f "$HOME/.local/bin/bashmarks.sh" ]; then
    echo "installing bashmarks"
    git clone https://github.com/huyng/bashmarks.git
    cd bashmarks
    sudo make install
    cd ..
    sudo rm -rf bashmarks
fi
