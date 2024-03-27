#!/bin/bash

# vim-plug
# --------------------------------------------------
echo -e "\033[34mChecking if vim-plug exists...\033[0m"
if [ -f "${HOME}/.vim/autoload/plug.vim" ]; then
  echo -e "\033[32mYou already have vim-plug, awesome!\033[0m"
else
  echo -e "\033[31mNope, installing vim-plug\033[0m"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Ripgrep
# --------------------------------------------------
echo -e "\033[34mChecking if rg exists...\033[0m"
if command -v rg &> /dev/null; then
  echo -e "\033[32mYou already have rg, awesome!\033[0m"
else
  echo -e "\033[31mNope, installing rg (rigrep)\033[0m"
  # Debian-based stuff
  sudo apt install -y ripgrep
fi

# ZSH
# --------------------------------------------------
echo -e "\033[34mChecking if zsh is installed\033[0m"
if command -v zsh &> /dev/null; then
  echo -e "\033[32mYou already have zsh, awesome!\033[0m"
else
  echo -e "\033[31mNope, installing zsh\033[0m"
  sudo apt install -y zsh
fi

# Oh-my-zsh
# --------------------------------------------------
echo -e "\033[34mChecking if oh-my-zsh is installed\033[0m"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  echo -e "\033[32mYou already have oh-my-zsh, awesome!\033[0m"
else
  echo -e "\033[31mNope, installing oh-my-zsh\033[0m"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"

  # spaceship-prompt
  # --------------------------------------------------
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM}/themes/spaceship-prompt" --depth=1
  ln -s "${ZSH_CUSTOM}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM}/themes/spaceship.zsh-theme"

  sed -i 's/robbyrussell/spaceship/' $HOME/.zshrc
fi

# .vimrc
# --------------------------------------------------
echo -e "\033[34mCopying .vimrc to ~/.vimrc\033[0m"
cp -i .vimrc $HOME/.vimrc

# .gitconfig
# --------------------------------------------------
echo -e "\033[34mCopying .gitconfig to ~/.gitconfig\033[0m"
cp -i .gitconfig $HOME/.gitconfig

echo -e "\033[34mCopying .zsh-aliases to ~/.zsh-aliases\033[0m"
cp -i .zsh-aliases $HOME/.zsh-aliases
cp -i tmux.conf $HOME/.tmux.conf

if grep -q "zsh-aliases" "${HOME}/.zshrc"; then
  echo -e "\033[32m~/.zshrc contains .zsh-alises so I'm not adding it\033[0m"
else
  echo -e "\033[31mAdding .zsh-aliases to ~/.zshrc\033[0m"
  echo "source ~/.zsh-aliases" >> $HOME/.zshrc
fi
