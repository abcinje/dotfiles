#!/usr/bin/env bash

CURR_DIRPATH=$(dirname $0)
HOME_DIRPATH=$(realpath --relative-to=$HOME $CURR_DIRPATH)
ln -fs $HOME_DIRPATH/vimrc $HOME/.vimrc
ln -fs $HOME_DIRPATH/gitconfig $HOME/.gitconfig
