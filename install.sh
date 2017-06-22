#!/bin/bash

function brew_packages() {
  if type brew > /dev/null 2>&1;
  then
    brew tap homebrew/bundle
    brew bundle
  else
    echo "Installing Homebrew first."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew_packages
  fi
}

function symlink_dotfiles() {
  if type rcup > /dev/null 2>&1 && [ -d ~/dotfiles ];
  then
    rcup -d ~/dotfiles -x install.sh -x com.googlecode.iterm2.plist -x Brewfile
  else
    echo "Missing rcm or your dotfiles aren't where you think they are."
    exit 1
  fi
}

function switch_shell() {
  _which_shell=$(which "$SHELL")
  if [ "$_which_shell" == "/bin/bash" ]; then
    _which_bash=$(which bash)
    if [ "$_which_bash" == "/usr/local/bin/bash" ]; then
      echo "Need to switch to homebrewed bash."
      sudo 'echo /usr/local/bin/bash >> /etc/shells'
      chsh -s /usr/local/bin/bash
    fi
  fi
}


function setup_vundle_tpm() {
  VUNDLEDIR=$HOME/.vim/bundle/Vundle.vim

  if [ ! -d "$VUNDLEDIR" ];
  then
    git clone https://github.com/gmarik/vundle.git "$VUNDLEDIR"
    vim +PluginInstall +qa
  fi

  if [ ! -d "$HOME/.tmux/plugins/tpm" ];
  then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
}

function other_junk() {
  mkdir -p ~/.vim/undo
}

brew_packages
symlink_dotfiles
switch_shell
setup_vundle_tpm
other_junk
