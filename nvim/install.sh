#!/usr/bin/env bash

if [[ "$OSTYPE" == darwin* ]]; then
  nvim="nvim-macos-arm64"
else
  nvim="nvim-linux-x86_64"
fi

sudo -s -- <<EOF
cd /opt
rm -r $nvim
wget https://github.com/neovim/neovim/releases/download/stable/$nvim.tar.gz
tar -xf $nvim.tar.gz
rm $nvim.tar.gz
mkdir -p /usr/local/bin
ln -sf /opt/$nvim/bin/nvim /usr/local/bin/nvim
EOF

mkdir -p "$HOME/.config/nvim"
link_file "$dotfiles_root/nvim/lua" "$HOME/.config/nvim/lua"
link_file "$dotfiles_root/nvim/init.lua" "$HOME/.config/nvim/init.lua"
