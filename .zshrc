export ZSH=$HOME/.oh-my-zsh

plugins=(git zsh-autosuggestions golang jira redis-cli gitignore colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting docker)

source $ZSH/oh-my-zsh.sh

ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure

# environment variables
export PATH=$PATH:/usr/local/bin
export LC_CTYPE=C
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# go related environment variables
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

# node related environment variables
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# vim key binding
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# fasd related
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim' # quick opening files with vim

# add ssh password to ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval `ssh-agent`
      ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

# git setting
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global color.ui true
git config --global core.editor vim

# docker alias
alias docker-clean-volume='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker-clean-images='docker rmi $(docker images -f "dangling=true" -q)'
function docker-clean-aufs {
    docker rm -f $(docker ps -a -q)
    docker rmi -f $(docker images -a -q)
    sudo service docker stop
    sudo rm -rf /var/lib/docker/aufs
    sudo rm -f /var/lib/docker/linkgraph.db
    sudo service docker start
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Clang related tools
export PATH="/usr/local/opt/llvm/bin:$PATH"
