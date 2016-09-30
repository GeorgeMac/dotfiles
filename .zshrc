HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/admin/.zshrc'

autoload -Uz compinit
compinit

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export GOPATH="$HOME/go"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:/usr/local/mysql/bin"
export PATH=$PATH":$HOME/dist/go/bin"
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

# Local Settings
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Git
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

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
