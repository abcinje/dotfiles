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

CURR_DIRPATH=$(dirname $0)
HOME_DIRPATH=$(realpath --relative-to=$HOME $CURR_DIRPATH)

link_file $HOME_DIRPATH/vimrc $HOME/.vimrc
link_file $HOME_DIRPATH/gitconfig $HOME/.gitconfig
