#!/bin/bash 

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function get_git_color() {
  if [[ $(parse_git_branch) =~ "master" ]]
  then
    echo -e "%F{cyan}$(parse_git_branch)%b"
  elif [[ $(parse_git_branch) =~ "prod" ]]
  then
    echo -e "%F{red}$(parse_git_branch)%b"
  else
    echo -e "%F{magenta}$(parse_git_branch)%b"
  fi
}

ret_status="%(?:%{%F{green}%}%*%f:%{%F{red}%}%*%f)"

export PS1="%F{red}%n%f%F{green}@%f%F{blue}pgeringer%f%F{yellow}:%~%f\$(get_git_color)%F{magenta}\$%f
%F{green}${ret_status}%f ∴ "
