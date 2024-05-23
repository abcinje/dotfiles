#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

cd /opt
rm -r nvim-linux64
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
