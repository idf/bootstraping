#!/usr/bin/env bash
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update

brew install bash-completion2
brew install git
brew install tree
brew install tmux
brew install ruby
brew install npm
brew install fpp  # facebook path picker
brew install emacs --with-gnutls

brew install caskroom/cask/brew-cask
brew tap caskroom/versions  # alternate versions
brew cask install sublime-text3
brew cask install smoothmouse
brew cask install skim

brew cleanup
