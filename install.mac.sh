# packages
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew install zsh zsh-completions silversearcher-ag exuberant-ctags tig
chsh -s "$(which zsh)"

# install docker and docker-toolbox
brew update && brew cask install docker docker-toolbox

# install fzf
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# install go
mkdir -p "$HOME"/go
wget https://storage.googleapis.com/golang/go1.8.darwin-amd64.pkg
sudo installer -pkg go1.8.darwin-amd64.pkg -target /
rm go1.8.darwin-amd64.pkg
export PATH=$PATH:/usr/local/go/bin

brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste

# this solves "dyld: Library not loaded: /usr/local/opt/readline/lib/libreadline.6.dylib" when launching GDB
ln -s /usr/local/opt/readline/lib/libreadline.7.dylib /usr/local/opt/readline/lib/libreadline.6.dylib
