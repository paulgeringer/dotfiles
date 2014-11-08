# def rvm_crap
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" 
# end rvm_crap

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

stty start undef stop undef

source ~/.aliases

ssh-add > /dev/null 2>&1

if [ "$(whoami)" != "paulgeringer" ]; then
  export DYLD_LIBRARY_PATH="/Applications/Oracle"
  export ORACLE_HOME="/Applications/Oracle"
  export SQLPATH="/Applications/Oracle"
  export TNS_ADMIN="/Applications/Oracle"
  export NLS_LANG="AMERICAN_AMERICA.UTF8"
  export PATH=$PATH:$DYLD_LIBRARY_PATH
  export INSTANT_CLIENT_DIRECTORY="/Applications/Oracle"
  export PATH=$PATH:$HOME/.rvm/bin
  #export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
  export GREP_OPTIONS='--color=auto'
  export PATH=$PATH:/Users/pgeringer/Development/ib-dev/script
  export PATH=/Users/pgeringer/Development/ib-dev/bin:$PATH
  export TERM=screen
fi

if [ "$(whoami)" == "paulgeringer" ]; then
  export TERM=screen-256color
fi

export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

HISTFILESIZE=50000

settitle() {
    printf "\033k$1\033\\"
}

ssh() {
    settitle "$*"
    command ssh "$@"
    settitle "bash"
}

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Git PS1 Stuff

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function alternate_git_branch_parse() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

RED="\e[0;31m"
YELLOW="\e[0;33m"
GREEN="\e[0;32m"
PURPLE="\e[0;35m"
BLUE="\e[0;34m"
NO_COLOR="\e[0m"
BOLD_RED="\e[1;31m"
BOLD_CYAN="\e[1;36m"
BOLD_PURPLE="\e[1;35m"

function get_git_color() {
  if [[ $(parse_git_branch) == "master" ]]
  then
    GIT_STRING=$BOLD_CYAN$(parse_git_branch)$NO_COLOR
  elsif [[ $(parse_git_branch) =~ prod ]]
    GIT_STRING=$BOLD_RED$(parse_git_branch)$NO_COLOR
  else
    GIT_STRING=$BOLD_PURPLE$(parse_git_branch)$NO_COLOR
  fi
  printf "$GIT_STRING"
}

export PS1="$RED\u$NO_COLOR$GREEN@$NO_COLOR$BLUE\h$NO_COLOR$YELLOW:\w$NO_COLOR$BOLD_CYAN (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))$NO_COLOR$PURPLE\$$NO_COLOR \n∴ "
#export PS1="$RED\u$NO_COLOR$GREEN@$NO_COLOR$BLUE\h$NO_COLOR$YELLOW:\w$NO_COLOR\$(get_git_color)$GIT_STRING$NO_COLOR$PURPLE\$$NO_COLOR \n∴ "
