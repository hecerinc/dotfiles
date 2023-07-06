#!/bin/bash

NVIM_DIR="$HOME/nvim"

echo 'export $XDG_CONFIG_HOME=$HOME' >> ~/.zshrc
echo 'export $XDG_CONFIG_HOME=$HOME' >> ~/.profile

mkdir -i $NVIM_DIR

cp ./nvim/init.vim ./nvim/ginit.vim $NVIM_DIR

ln -s "$HOME/.vim/plugged" "$NVIM_DIR/plugged"
ln -s "$HOME/.vim/colors" "$NVIM_DIR/colors"
ln -s "$HOME/.vim/autoload" "$NVIM_DIR/autoload"
