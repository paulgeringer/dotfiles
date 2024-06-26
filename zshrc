zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/paulgeringer/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pawl"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew docker fzf git tig)

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.fzf.zsh
setopt no_hist_verify

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

setopt inc_append_history
setopt share_history
setopt menu_complete
setopt appendhistory
setopt sharehistory
setopt incappendhistory
#bindkey -M menuselect '^M' .accept-line # One enter on menu_complete
alias jq="noglob jq"
alias vim="nvim"

#setopt PROMPT_SUBST
#TRAPWINCH() {
  #zle && { zle reset-prompt; zle -R }
#}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/opt/homebrew/bin:$PYENV_ROOT/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/sbin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  #eval "$(pyenv virtualenv-init -)"
fi
# Venv
source /opt/homebrew/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development
export VIRTUALENVWRAPPER_PYTHON=$(which python)

export FZF_DEFAULT_COMMAND='ag -i --nocolor --nogroup --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore .tox --ignore .pyc -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

_fzf_compgen_path() {
  ag -i --nocolor --nogroup --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore .tox --ignore .pyc -g $1 
}

_fzf_compgen_dir() {
  ag -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore .tox --ignore .pyc -g $1 
}

if [ -e ~/.aliases.public ]
then
  source ~/.aliases.public
fi

if [ -e ~/.aliases.private ]
then
  source ~/.aliases.private
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval $(thefuck --alias)

HISTFILE=/Users/paulgeringer/.history_dir/.zsh_history
if [ ! -e $HISTFILE ]
then
  mkdir /User/paulgeringer/.history_dir
  touch $HISTFILE
fi
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt extendedglob


### DOTNET VSCODE BS
#export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR=$(echo $HOME/.asdf/installs/dotnet-core/3.1.417/sdk/*/Sdks)
#export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_VER=3.1.417
#export DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=$(echo $HOME/.asdf/installs/dotnet-core/3.1.417)
#if [ -e ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh ]; then
  #. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
#fi
#
#if command -v rbenv 1>/dev/null 2>&1; then
  #eval "$(rbenv init - zsh)"
#fi
# only uncheck when needed, for some reason this is slow? maybe a bad implementation
#export PATH="$HOME/.jenv/versions/1.8/bin:$PATH"
#if command -v jenv 1>/dev/null 2>&1; then
  #export PATH="$HOME/.jenv/bin:$PATH"
  #eval "$(jenv init -)"
#fi
#
#export ASDF_HOME=$HOME/.asdf
#if [ -s $ASDF_HOME/shims/virtualenvwrapper.sh ];
#then
  #source $ASDF_HOME/shims/virtualenvwrapper.sh
#fi
#
if [ -s $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi
