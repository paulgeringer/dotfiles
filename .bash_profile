[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

stty start undef stop undef

alias test01='ssh root@ib3test01.backstoptest'
alias test02='ssh root@ib3test02.backstoptest'
alias test03='ssh root@ib3test03.backstoptest'
alias test04='ssh root@ib3test04.backstoptest'
alias dev-ib='ssh root@dev-ib.backstoptest'
alias prod-ib='ssh root@prod-ib.backstoptest'
alias qa='ssh ib3qa01.investorbridge'
alias longbus='ssh ib3longbus01.investorbridge'
alias longbusjobs='ssh ib3longbusjobs01.investorbridge'
alias snapshotlongbus='ssh ib3longbussnapshot.investorbridge'
alias prod01='ssh ib3prod01.investorbridge'
alias prod02='ssh ib3prod02.investorbridge'
alias prodjobs01='ssh ib3prodjobs01.investorbridge'
alias prodjobs02='ssh ib3prodjobs02.investorbridge'
alias snapshot='ssh ib3snapshot.investorbridge'
alias beta01='ssh ib3beta01.investorbridge'
alias beta03='ssh ib3beta03.investorbridge'
alias betajobs01='ssh ib3betajobs01.investorbridge'
alias betajobs03='ssh ib3betajobs03.investorbridge'
alias client='ssh ib3client02.investorbridge'
alias alpha='ssh ib3alpha01.investorbridge'
alias psg='ssh ib3psg01.investorbridge'
alias npvm='ssh npvm.backstop.local'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias ls='ls -G'
alias dev='source ~/.bash_profile ; cd ~/Development/ib-dev'
alias wolf='ssh ibbuilder@wolfware'
alias builder='ssh ibbuilder@builder.backstoptest'
alias schema='/Users/pgeringer/Development/ib-dev/script/schema.sh'
alias rup='launchctl start homebrew.mxcl.redis'
alias rdown='launchctl stop homebrew.mxcl.redis'
alias vi='vim'
alias ant-watermarking="ant deploy-clean -DTOMCAT_HOME=/usr/local/Cellar/tomcat/7.0.39/libexec -DRUNNING_APP_LOCATION='\''http://localhost:8080'\''' -Dbuild.dir=/usr/local/Cellar/tomcat/7.0.39/libexec/webapps"
alias pman='~/.bin/pman'
#alias start_tmux=tmuxer
alias gitx='open /Applications/GitX.app'
alias mojito='source ~/.bash_profile ; cd ~/Development/mojito'
alias backstop='$JBOSS_HOME/bin/run.sh -b 0.0.0.0 -c backstop'

alias migrate='RAILS_ENV=development bundle exec rake db:migrate:all'

ssh-add > /dev/null 2>&1

export DYLD_LIBRARY_PATH="/Applications/Oracle" 
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
export JBOSS_HOME=/Users/pgeringer/dev/jboss-5.1.0.GA

# Speed up RSpec!
export RUBY_FREE_MIN=200000
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_GC_MALLOC_LIMIT=9000000

source ~/.profile
HISTFILESIZE=50000

#tmuxer() {
#  export TMUX_SOCK=${TMUX_SOCK:-/var/tmux/pairing}
#  export SESSION=${SESSION:-IB}
#
#  TMUX="tmux -2 -S $TMUX_SOCK"
#
#  if ($TMUX has-session -t $SESSION 2> /dev/null); then
#      exec $TMUX attach -t $SESSION
#  else
#      $TMUX new-session -s $SESSION
#  fi
#}

settitle() {
    printf "\033k$1\033\\"
}

ssh() {
    settitle "$*"
    command ssh "$@"
    settitle "bash"
}

