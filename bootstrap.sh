#!/usr/bin/env bash

cd $(dirname $0)
dotfiles_root=$(pwd)

source util.sh

if [ $# -gt 0 ]; then
  error=false
  for dir in $@; do
    if [ ! -d $dir ]; then
      error=true
      echo "Invalid argument: $dir"
    fi
  done

  if $error; then
    echo "Aborting."
    exit 1
  fi

  list=$@
else
  for file in $(ls); do
    if [ -d $file ]; then
      list="$list $file"
    fi
  done
fi

for dir in $list; do
  echo "Configuring $dir..."
  source $dir/install.sh
done

echo "Done."
