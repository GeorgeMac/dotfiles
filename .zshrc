export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="georgemac"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export GOPATH="/Users/george/go"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:/usr/local/mysql/bin"
export PATH=$PATH":/go/bin"
export PATH=$PATH":$HOME/.rbenv/bin"

# rbenv
eval "$(rbenv init -)"

##### begin banner #####
NAME="GeorgeMac"
if [ "$(tput cols)" -lt 100 ]; then
  NAME="George"
fi
echo
echo
echo -n "$fg[blue]"
figlet -c -w $(tput cols) -f rozzo $NAME 
echo
echo
if command -v docker-machine >/dev/null 2>&1; then
  DM_STATUS="$(docker-machine status default)"
  echo -n "$fg[yellow]"
  if [ $DM_STATUS = "Running" ]; then
    echo -n "$fg[green]"
    eval $(docker-machine env default)
  elif [ $DM_STATUS = "Stopped" ]; then
    echo -n "$fg[red]"
  fi
  figlet -c -w $(tput cols) -f chunky "Docker Machine $DOCKER_MACHINE_NAME Is $DM_STATUS"
  echo "$reset_color"
fi
#####  end banner  #####

# Local Settings
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Functions
function dm-env() {
  eval $(dm env default)
}

# Git
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Docker Machine
alias dm="docker-machine"
alias dms="dm start default"
alias dmf="dm stop default"
alias dme="dm-env"
alias dmst="dm status default"
alias dmip="dm ip default"

# Ruby
alias b="bundle"
alias bi="b install"
alias be="b exec"
alias cukes="be cucumber --tags ~@WIP -v"

# Other
alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"
alias vizshrc="vi ~/.zshrc"
alias reload=". ~/.zshrc"
alias oack="ack --output='\$1'"
alias railsack="ack --ignore-dir db --ignore-dir log --ignore-dir tmp --ignore-dir .rbenv"

# It's like cat, but pretty
function ccat() {
  filename=$(basename "$1")
  extension="${filename##*.}"
  cat $1 | highlight --syntax $extension -O xterm256 -s zenburn
}

# Change Directory callback functions 
function cd() {
  builtin cd "$@"
  present=`pwd`;

  # when working for the man
  if [[ "$present" == *"work/honeycomb/src"* ]]; then
    # Service Discovery For Dummys
    discover
  fi
}

function discover() {
  # evaluate docker machine env default
  dme
  # get docker machine IP 
  ip=`dmip 2>/dev/null`

  # Service Discovery For Dummys
  if [[ "$ip" != "" ]]; then
    export DATABASE_URL="mysql2://$ip:3306"
    export REDIS_URL="redis://$ip:6379"
  fi
}

# Bastion Commands
alias dev-bastion="fwknop -Rn dev-bastion -w /usr/local/bin/wget && ssh dev-bastion"
