#!/usr/bin/env bash

cd $(dirname $0)
dotfiles_root=$(pwd)

source util.sh

for dir in $(ls); do
  if [ -f $dir/install.sh ]; then
    echo "Configuring $dir..."
    source $dir/install.sh
  fi
done
echo "Done."
