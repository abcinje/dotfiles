#!/usr/bin/env bash

cd $(dirname $0)
dotfiles_root=$(pwd)

source util.sh

link_file $dotfiles_root/vim/vimrc $HOME/.vimrc
link_file $dotfiles_root/git/gitconfig $HOME/.gitconfig
link_file $dotfiles_root/tmux/tmux.conf $HOME/.tmux.conf
link_file $dotfiles_root/zsh/zshrc $HOME/.zshrc

if [ -d $HOME/.oh-my-zsh ]; then
  link_file $dotfiles_root/zsh/injae.zsh-theme $HOME/.oh-my-zsh/custom/themes/injae.zsh-theme
fi
