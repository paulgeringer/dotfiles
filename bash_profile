[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

stty start undef stop undef

source ~/.aliases

ssh-add > /dev/null 2>&1

export DYLD_LIBRARY_PATH="/Applications/Oracle" 
export ORACLE_HOME="/Applications/Oracle"
export SQLPATH="/Applications/Oracle"
export TNS_ADMIN="/Applications/Oracle"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH=$PATH:$DYLD_LIBRARY_PATH
export RC_ARCHS=i386
export INSTANT_CLIENT_DIRECTORY="/Applications/Oracle"
export CC=/usr/local/bin/gcc-4.2
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/usr/local/bin/apache-activemq-5.7.0/bin
export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
export GREP_OPTIONS='--color=auto'
export PATH=$PATH:/Users/pgeringer/Development/ib-dev/script
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
export JBOSS_HOME=/Users/pgeringer/dev/jboss-5.1.0.GA
export PATH=/Users/pgeringer/Development/ib-dev/bin:$PATH
export ORACLEHOST=192.168.42.218

# Speed up RSpec!
export RUBY_FREE_MIN=200000
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_GC_MALLOC_LIMIT=9000000

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
    . ~/.git-completion.bash
fi
