#!/usr/bin/env bash

cd $(dirname $0)
dotfiles_root=$(pwd)

source util.sh

for file in $(ls); do
  if [ -f $file/install.sh ]; then
    echo "Configuring $file..."
    source $file/install.sh
  fi
done
echo "Done."
