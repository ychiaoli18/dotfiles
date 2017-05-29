# packages
sudo apt-get update && sudo apt-get install zsh silversearcher-ag exuberant-ctags tig
chsh -s "$(which zsh)"

# install go
mkdir -p "$HOME"/go
wget -qO - https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz | tar -C /usr/local -xvz
export PATH="$PATH":/usr/local/go/bin
