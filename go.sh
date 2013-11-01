#!/bin/bash

# Install everything necessary for my development environment
INSTALL_COMMAND="sudo apt-get install"
PACKAGES="guake git zsh curl"

ZSH_CONFIG=".zshrc"
VIM_CONFIG=".vimrc"

# Package installation
echo "Packages installation"
$INSTALL_COMMAND $PACKAGES

echo "Install oh-my-zsh"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Copy dot files
echo "Copy zshrc file"
cp -fv $ZSH_CONFIG $HOME

echo "Copy vimrc file"
cp -fv $VIM_CONFIG $HOME
