# packages
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew install zsh zsh-completions silversearcher-ag exuberant-ctags tig
chsh -s "$(which zsh)"

# install go
mkdir -p "$HOME"/go
wget https://storage.googleapis.com/golang/go1.8.darwin-amd64.pkg
sudo installer -pkg go1.8.darwin-amd64.pkg -target /
rm go1.8.darwin-amd64.pkg
export PATH=$PATH:/usr/local/go/bin
