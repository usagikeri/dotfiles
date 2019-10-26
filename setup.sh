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
mkdir -p ~/.config/nvim

# make link setting file
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/nvim ~/.config/nvim
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/tex/latexmkrc ~/.latexmkrc

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python Install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
pyenv install 3.7.0

# Neovim pluginstall
nvim +pluginstall +qa

# ============================================================================================== #
# スクリプト実行後に行うこと                                                                     #
# ============================================================================================== #
# - texは`brew cask install mactex`を行ってもなぜかplatexコマンドが使えないので，                #
#   pkgをWebからダウロードして，インストールする．                                               #
# - .commadファイルをalfredから呼び出したときに自動的に終了するように，                          #
#   ターミナルの `環境設定/シェル/シェル終了時:` を `シェルが正常に終了した場合は閉じる` にする．#
# ============================================================================================== #
