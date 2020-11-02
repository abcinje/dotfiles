#!/usr/bin/env bash

function link_file {
  local src=$1 dst=$2

  if [ -e $2 ]; then
    echo "File $2 already exists!"
    echo -n "Do you want to overwrite? [y/n] "
    read action
    case $action in
      y|Y)
        ;;
      *)
        return
    esac
  fi

  ln -sf $1 $2
}

cd $(dirname $0)
DOTFILES_ROOT=$(pwd)

link_file $DOTFILES_ROOT/vimrc $HOME/.vimrc
link_file $DOTFILES_ROOT/gitconfig $HOME/.gitconfig

if [ -d $HOME/.oh-my-zsh ]; then
	link_file $DOTFILES_ROOT/injae.zsh-theme $HOME/.oh-my-zsh/custom/themes/injae.zsh-theme
fi
