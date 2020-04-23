#!/usr/bin/env bash

CURR_DIRPATH=$(dirname $0)
sudo cp $CURR_DIRPATH/colors/* /usr/share/vim/vim*/colors/

HOME_DIRPATH=$(realpath --relative-to=$HOME $CURR_DIRPATH)
ln -fs $HOME_DIRPATH/vimrc $HOME/.vimrc
ln -fs $HOME_DIRPATH/gitconfig $HOME/.gitconfig
