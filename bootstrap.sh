#!/usr/bin/env bash

cd $(dirname $0)
dotfiles_root=$(pwd)

source util.sh

for dir in $(ls); do
  if [ -d $dir ]; then
    echo "Configuring $dir..."
    if [ -f $dir/install.sh ]; then
      source $dir/install.sh
    fi
  fi
done
echo "Done."
