#!/usr/bin/env bash

SRC=$PWD

cd "$HOME" || exit

# link rc files
for config in .vimrc .zshrc .tmux.conf .gitconfig; do
  echo "Creating soft link for $config ..."
  ln -sf "$SRC/$config" .
done

# python related
pip install powerline-status
pip install jedi

# Bin utils
cp -r "$SRC"/bin "$HOME"/bin
cd "$HOME"/bin || exit

# Zsh plugins
ZSH_DIR=$HOME/bin/zsh
mkdir -p "$ZSH_DIR"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_DIR"/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions "$ZSH_DIR"/zsh-autosuggestions.git

# vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
vim +BundleInstall +qall

# fasd
git clone https://github.com/clvv/fasd
cd fasd && sudo make install

cd "$SRC"

# install nvm, node and npm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install stable && nvm use stable && nvm alias default stable

npm install --global pure-prompt

# install platform specific settings
if python -mplatform | grep -qi Ubuntu; then
  chmod +x ./install.ubuntu.sh && ./install.ubuntu.sh
elif [ "$(uname)" == "Darwin" ]; then
  chmod +x ./install.mac.sh && ./install.mac.sh
fi
