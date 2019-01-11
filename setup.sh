#!/bin/bash

PWD=`pwd`

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew bundle
brew bundle
brew cleanup

ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

# Python Install
pyenv install 3.7.0

# Neovim PlugInstall
nvim +PlugInstall +qa
