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
  :
fi

# So CTRL-S doesn't freeze the terminal, apparently...
#stty start undef stop undef

source ~/.aliases

if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

export _HOSTNAME="pgeringer"
source ~/.ps1_settings

if [ -e ~/.locale ]
then
  source ~/.locale
fi

if [ -e ~/.shellcheckrc ]
then
  source ~/.shellcheckrc
fi

if [ -e /etc/environment ]
then
  source /etc/environment
fi

if [ -d ~/lib ]
then
  for file in ~/lib/*.sh;
  do
    source "$file"
  done
fi

eval "$(hub alias -s)"

# Get my identity added in each shell
#ssh-add > /dev/null 2>&1

# Hooray work junk
if [ "$(whoami)" == "pgeringer" ]
then
  #source ~/.oracle_junk
  :
fi

# Standard Stuff
export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR
export TERM=xterm-256color
if [ ! -z "$TMUX" ]; then
  export TERM=screen-256color
fi
brew_prefix=$(brew --prefix)
export HISTFILESIZE=
export HISTSIZE=
export GREP_OPTIONS="--color=auto"
export PATH=/usr/local/opt/python@2/libexec/bin:$PATH:~/Development/lib:~/lib:~/Development/dockhub
export RUBY_CONFIGURE_OPTS=--with-readline-dir="${brew_prefix:-/usr/local}/opt/readline"
export TMUX_SOCK=/var/tmux/pairing
export WORKON_HOME=~/.venvs
export HOMEBREW_AUTO_UPDATE_SECS=3600
#source /usr/local/bin/virtualenvwrapper.sh

## TMUX WINDOW HISTORY SHARING GROSSNESS

export HISTCONTROL=ignoredups:erasedups:ignoreboth

shopt -s histappend

#After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Fzf stuff
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='ag -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore "**/*.pyc" -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
complete -F _fzf_path_completion -o default -o bashdefault tig

#def rbenv crap
if [ -s "$HOME/.rbenv" ]
then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init - --no-rehash)"
fi
#end rbenv crap

#def pyenv crap
if command -v pyenv 1>/dev/null 2>&1;
then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - --no-rehash)"
  eval "$(pyenv virtualenv-init - --no-rehash)"
fi
#end pyenv crap
