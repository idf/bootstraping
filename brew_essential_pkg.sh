#!/usr/bin/env bash
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install Bash 4.
brew install bash
if ! grep -q /usr/local/bin/bash /etc/shells; then
    sudo echo /usr/local/bin/bash >> /etc/shells
fi
chsh -s /usr/local/bin/bash


# Better Bash Completion
brew install bash-completion2  # requires Bash 4.0+

brew install git
brew install git-lfs
brew install wget
brew install tree
# brew install tmux  # install version 2.9s
brew install ruby
brew install npm
brew install fpp  # facebook path picker
brew install emacs
brew install hstr  # bash history, trigger: c-r
brew install sshrc
brew install mosh
brew install broot
brew install diff-so-fancy
brew install ikuwow/ikuwow-sshrc/sshrc

# Binaries
brew install cask
brew tap homebrew/cask
brew install sublime-text
brew install skim
brew install spectacle
brew install devdoc

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

brew cleanup

# install specific tmux version
bash tmux_29a.bash
