#!/bin/bash

PWD=`pwd`

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew bundle
brew bundle
brew cleanup

# add Ricty font
cp -f /usr/local/Cellar/ricty/4.1.0_2/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

#make dir
mkdri -p ~/.config/nvim

# make link setting file
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python Install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
pyenv install 3.7.0

# Neovim PlugInstall
nvim +PlugInstall +qa
