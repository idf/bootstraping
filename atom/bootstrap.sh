#!/usr/bin/env bash

brew cask install atom

cur=$(pwd)
bash $cur/pkgs.sh

flag="-nfs"
ln $flag "$cur/keymap.cson" "$HOME/.atom/keymap.cson"
ln $flag "$cur/styles.less" "$HOME/.atom/styles.less"

echo "Change font family to Fira Code"
