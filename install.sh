#!/bin/bash

function find_files() {
  find . -type f -not -path '*.git*' -not -name "install.sh" -not -name 'README.md' | strip_current_dir
}

function find_directories() {
  find . -type d -not -path '*.git*' -not -name '.' | strip_current_dir
}

function strip_current_dir() {
  sed 's/\.\///g'
}

function create_directories() {
  for directory in $(find_directories)
  do
    if [ ! -d ~/"$directory" ];
    then
      #mkdir ~/"$directory"
      echo "mkdir ~/$directory"
    fi
  done
}

function symlink_files() {
  for file in $(find_files)
  do
    if echo "$file" | grep -q "/" && [ ! -e ~/"$file" ]
    then
      #ln -s "$(pwd)/$file" ~/"$file"
      echo "ln -s $(pwd)/$file ~/$file"
    else [ ! -e ~/."$file" ]
      #ln -s "$(pwd)/$file" ~/."$file"
      echo "ln -s $(pwd)/$file ~/.$file" # everything hits here?
    fi
  done
}

create_directories
symlink_files
