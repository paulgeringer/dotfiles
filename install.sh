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
    rcup -x install.sh -x com.googlecode.iterm2.plist -x brew_leaves # initial set up, so assume .rcrc isn't installed yet
  else
    echo "Missing rcm or your dotfiles aren't where you think they are."
    exit 1
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

brew_packages
symlink_dotfiles
setup_vundle_tpm
