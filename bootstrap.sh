#!/bin/bash

# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# THE FOLLOWING MAY REQUIRE 
# A BREW TAP FROM SOMEWHERE AROUND THE INTERNET
# IT IS NOT TESTED


# grab standalone binaries
CASKS=$(cat ./casks.txt)
brew cask install "${CASKS}"

# grab brew packages from previous installs
PACKAGES=$(cat ./packages.txt)
brew install "${PACKAGES}"

# use gnu coreutils by defaults
echo 'export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"' >> ~/.zshrc