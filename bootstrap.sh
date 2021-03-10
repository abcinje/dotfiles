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
dotfiles_root=$(pwd)

link_file $dotfiles_root/vim/vimrc $HOME/.vimrc
link_file $dotfiles_root/git/gitconfig $HOME/.gitconfig
link_file $dotfiles_root/tmux/tmux.conf $HOME/.tmux.conf
link_file $dotfiles_root/zsh/zshrc $HOME/.zshrc

if [ -d $HOME/.oh-my-zsh ]; then
  link_file $dotfiles_root/zsh/injae.zsh-theme $HOME/.oh-my-zsh/custom/themes/injae.zsh-theme
fi
