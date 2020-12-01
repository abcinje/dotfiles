#!/usr/bin/env bash

function link_file {
  local src=$1 dst=$2

  if [ -e $dst ]; then
    echo "File $dst already exists!"
    echo -n "Do you want to overwrite? [y/n] "
    read action
    case $action in
      y|Y)
        ;;
      *)
        return
    esac
  fi

  ln -sf $src $dst
}

cd $(dirname $0)
DOTFILES_ROOT=$(pwd)

link_file $DOTFILES_ROOT/vim/vimrc $HOME/.vimrc
link_file $DOTFILES_ROOT/git/gitconfig $HOME/.gitconfig
link_file $DOTFILES_ROOT/tmux/tmux.conf $HOME/.tmux.conf
link_file $DOTFILES_ROOT/zsh/zshrc $HOME/.zshrc

if [ -d $HOME/.oh-my-zsh ]; then
	link_file $DOTFILES_ROOT/zsh/injae.zsh-theme $HOME/.oh-my-zsh/custom/themes/injae.zsh-theme
fi
