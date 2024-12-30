#!/bin/bash
mkdir -p $HOME/.local/bin
echo 'export PATH=/home/hector/.local/bin:$PATH' >> ~/.zshrc

# Install neovim
mkdir -p $HOME/.downloads
cd $HOME/.downloads
sudo rm -rf /opt/nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz
ln -s $HOME/.downloads/nvim-linux64/bin/nvim $HOME/.local/bin/nvim

mkdir -p $HOME/.config/nvim
cp $HOME/dotfiles/nvim/* $HOME/.config/nvim/
DEST=$HOME/.config/nvim
ln -s $HOME/.vim/autoload $DEST/autoload
ln -s $HOME/.vim/plugged $DEST/plugged
