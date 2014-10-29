# def rvm_crap
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" 
# end rvm_crap

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
  export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
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
