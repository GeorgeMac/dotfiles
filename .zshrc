HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

case "$(uname)" in
  "Darwin")
    . "$HOME/.zshrc.darwin"
    ;;
  "Linux")
    . "$HOME/.zshrc.linux"
    ;;
  *)
    echo "Unexpected OS"
esac

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin"
export GPG_TTY=$(tty)

# Local Settings
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Git
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Docker Related
alias dm="docker-machine"

# Shortcuts
alias zshrc="vi ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias reload=". ~/.zshrc"

# Ack
alias oack="ack --output='\$1'"
alias gack="ack --ignore-dir vendor"
alias railsack="ack --ignore-dir db --ignore-dir log --ignore-dir tmp --ignore-dir .rbenv"
