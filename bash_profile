# vi: ft=sh

# def rvm_crap
if [[ -s "$HOME/.rvm/scripts/rvm" ]]
then
  source "$HOME/.rvm/scripts/rvm"
fi
export PATH="$PATH:$HOME/.rvm/bin"
# end rvm_crap


# Completion for bash and git

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# So CTRL-S doesn't freeze the terminal, apparently...
stty start undef stop undef

source ~/.aliases

source ~/.ps1_settings

# Get my identity added in each shell
ssh-add > /dev/null 2>&1

# Hooray work junk
if [[ "$(whoami)" == "pgeringer" ]]
then
  source ~/.oracle_junk
fi

# Standard Stuff
export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR
export TERM=screen-256color
export HISTFILESIZE=50000
export GREP_OPTIONS="--color=auto"

## TMUX WINDOW HISTORY SHARING GROSSNESS

export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
