HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
DISABLE_MAGIC_FUNCTIONS=true

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robby-custom"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="`go env GOPATH`/bin:$PATH"
export PATH="$HOME/overrides/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

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

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# User configuration
alias vi="nvim"
alias vim="nvim"
export EDITOR='vim'
export GPG_TTY=$(tty)
export GO111MODULE=on

# Local Settings
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Git
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
function gmb() {
  git checkout -b "gm/$1"
}

function gcz() {
  git checkout $(git branch | fzf | tr -d '[:space:]')
}

alias cdr="cd $(git rev-parse --show-toplevel)"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/georgemac/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/georgemac/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/georgemac/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/georgemac/google-cloud-sdk/completion.zsh.inc'; fi

function unescape {
  echo $1 | sed 's/\\t/    /g' | sed 's/\\n/☃/g' | tr '☃' '\n' | sed 's/\\//g'
}

