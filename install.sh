#!/usr/bin/env bash

SRC=$PWD

cd $HOME

# link rc files
for config in .vimrc .zshrc .tmux.conf; do
  echo "Creating soft link for $config ..."
  ln -sf $SRC/$config .
done

# Bin utils
cp -r $SRC/bin $HOME/bin
cd $HOME/bin

# Zsh plugins
ZSH_DIR=$HOME/bin/zsh
mkdir -p $ZSH_DIR
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_DIR/zsh-autosuggestions.git

# vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall

# fasd
git clone https://github.com/clvv/fasd
cd fasd && sudo make install

# install nvm, node and npm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install stable && nvm use stable && nvm alias default stable

if python -mplatform | grep -qi Ubuntu; then
  chmod +x install.ubuntu.sh && ./install.ubuntu.sh
elif [ "$(uname)" == "Darwin" ]; then
  chmod +x install.mac.sh && ./install.mac.sh
fi
