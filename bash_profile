#!/bin/bash
# vi: ft=sh

# Interactivity check
[[ $- == *i* ]] || return

# Completion for bash and git

if [ "$(uname)" == 'Darwin' ]
then
  if [ -f /usr/local/etc/bash_completion ]
  then
    source "$(brew --prefix)/etc/bash_completion"
  fi
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# So CTRL-S doesn't freeze the terminal, apparently...
#stty start undef stop undef

source ~/.aliases

source ~/.ps1_settings

source ~/.vundle_install

if [ -e ~/.locale ]
then
  source ~/.locale
fi

if [ -e /etc/environment ]
then
  source /etc/environment
fi

if [ -d ~/lib ]
then
  source ~/lib/git_extras.sh
fi

eval "$(hub alias -s)"

# Get my identity added in each shell
#ssh-add > /dev/null 2>&1

# Hooray work junk
if [ "$(whoami)" == "pgeringer" ]
then
  source ~/.oracle_junk
fi

# Standard Stuff
export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR
export TERM=xterm-256color
if [ ! -z "$TMUX" ]; then
  export TERM=screen-256color
fi
export HISTFILESIZE=50000
export HISTSIZE=""
export GREP_OPTIONS="--color=auto"
export PATH=$PATH:~/Development/lib:~/lib:~/Development/devtools

## TMUX WINDOW HISTORY SHARING GROSSNESS

export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# def rbenv crap
if [ -s "$HOME/.rbenv" ]
then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi
# end rbenv crap
