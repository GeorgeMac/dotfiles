export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export GOPATH="/Users/george/go"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:/usr/local/mysql/bin"
export PATH=$PATH":/go/bin"
export PATH=$PATH":$HOME/.rbenv/bin"

# rbenv
eval "$(rbenv init -)"

# goenv used to set GOPATH variable
function goenv {
START="$(pwd)"
if [ -z $1 ]; then
    echo $GOPATH
    return
fi
case "$1" in
    global)
        export GOPATH="/Users/george/go"
        ;;
    local)
        if [ -f ./.gopath ]; then
            export GOPATH=`pwd`
        else
            goenv-parent
        fi
        ;;
    init)
        touch .gopath
        goenv "local"
        ;;
    *)
        echo "Usage: goenv [global | local | init]"
        return
        ;;
esac
cd START>/dev/null 2>&1
unset START
}

# goenv-parent sets the GOPATH to the ancestor folder with a .gopath file
function goenv-parent {
if [ `pwd` = "/" ]; then echo "Cannot find .gopath" && return false; fi
cd ..
if [ -f ./.gopath ]; then
    export GOPATH=`pwd`
    return true
fi
goenv-parent
}

# Local Settings
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Git
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Docker Machine
alias dm="docker-machine"
alias dms="dm start default"
alias dmf="dm stop default"
alias dme="eval $(dm env default)"
alias dmst="dm status default"

# Other
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"
alias vizshrc="vi ~/.zshrc"
alias reload=". ~/.zshrc"
