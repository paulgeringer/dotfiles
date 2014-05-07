[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

stty start undef stop undef

# SSH aliases
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
alias prod11='ssh ib3prod11.investorbridge'
alias prod12='ssh ib3prod12.investorbridge'
alias prodjobs11='ssh ib3prodjobs11.investorbridge'
alias prodjobs12='ssh ib3prodjobs12.investorbridge'
alias snapshot='ssh ib3snapshot.investorbridge'
alias beta11='ssh ib3beta11.investorbridge'
alias beta12='ssh ib3beta12.investorbridge'
alias betajobs11='ssh ib3betajobs11.investorbridge'
alias betajobs12='ssh ib3betajobs12.investorbridge'
alias drbox='ssh ib3-dr-01.dl2.backstopsolutions'
alias drjobsbox='ssh ib3drjobs01.dl2.backstopsolutions'
alias client='ssh ib3client02.investorbridge'
alias alpha='ssh ib3alpha01.investorbridge'
alias psg='ssh ib3psg01.investorbridge'
alias npvm='ssh npvm.backstop.local'
alias wolf='ssh ibbuilder@wolfware'
alias builder='ssh ibbuilder@builder.backstoptest'

# Project aliases
alias mojito='source ~/.bash_profile ; cd ~/Development/mojito'
alias dev='source ~/.bash_profile ; cd ~/Development/ib-dev'
alias puppet='source ~/.bash_profile ; cd ~/Development/puppet'
alias spare='source ~/.bash_profile ; cd ~/Development/ib-spare'

# Random useful aliases
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias ls='ls -G'
alias vi='vim'
alias pman='~/.bin/pman'

# IB/FB specific aliases
alias schema='/Users/pgeringer/Development/ib-dev/script/schema.sh'
alias rup='launchctl start homebrew.mxcl.redis'
alias rdown='launchctl stop homebrew.mxcl.redis'
alias ant-watermarking="ant deploy-clean -DTOMCAT_HOME=/usr/local/Cellar/tomcat/7.0.39/libexec -DRUNNING_APP_LOCATION='\''http://localhost:8080'\''' -Dbuild.dir=/usr/local/Cellar/tomcat/7.0.39/libexec/webapps"
alias gitx='open /Applications/GitX.app'
alias backstop='$JBOSS_HOME/bin/run.sh -b 0.0.0.0 -c backstop'
alias workerkill='ps -ef | grep "resque\|god\|server.pid" | grep -v grep | awk '"'"'{print $2}'"'"' | xargs kill -9'
alias migrate='RAILS_ENV=development bundle exec rake db:migrate:all'
alias zombie_deployer='ruby script/zombie_deployer.rb'
alias gitpair='rvm $(cat /Users/pgeringer/Development/ib-dev/.ruby-version) do git pair'

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
export JBOSS_HOME=/Users/pgeringer/dev/jboss-5.1.0.GA
export PATH=/Users/pgeringer/Development/ib-dev/bin:$PATH
export ORACLEHOST=192.168.42.218

# Speed up RSpec!
export RUBY_FREE_MIN=200000
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_GC_MALLOC_LIMIT=9000000

source ~/.profile
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
