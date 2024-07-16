#!/usr/bin/env bash

sudo -s -- <<EOF
cd /opt
rm -r nvim-linux64
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
EOF

mkdir -p $HOME/.config/nvim
link_file $dotfiles_root/nvim/init.lua $HOME/.config/nvim/init.lua
