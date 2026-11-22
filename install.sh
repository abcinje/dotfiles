#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1
dotfiles_root=$(pwd)

source util.sh

list=()
if [ $# -gt 0 ]; then
  error=false
  for dir in "$@"; do
    if [ -d "$dir" ]; then
      list+=("$(basename "$(realpath "$dir")")")
    else
      error=true
      eecho "Invalid argument: $dir"
    fi
  done

  if $error; then
    eecho "Aborting."
    exit 1
  fi
else
  for dir in */; do
    list+=("${dir%/}")
  done
fi

for dir in "${list[@]}"; do
  if [ ! -f "$dir/install.sh" ]; then
    echo "Skipping $dir (no install.sh)"
    continue
  fi
  echo "Configuring $dir..."
  (source "$dir/install.sh")
done

echo "Done."
