#!/usr/bin/env bash

DIRPATH=$(realpath --relative-to=$HOME $(dirname $0))
ln -fs $DIRPATH/vimrc $HOME/.vimrc
