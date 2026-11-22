if [[ "$OSTYPE" == darwin* ]]; then
  nvim="nvim-macos-arm64"
else
  nvim="nvim-linux-x86_64"
fi

nvim_root="$HOME/.local/opt"
url="https://github.com/neovim/neovim/releases/download/stable/$nvim.tar.gz"
mkdir -p "$nvim_root" "$HOME/.local/bin"

# Download into a temp dir and replace the current version only on success
tmp=$(mktemp -d "$nvim_root/.nvim-XXXXXX")
if curl -fL -o "$tmp/$nvim.tar.gz" "$url" \
  && tar -xf "$tmp/$nvim.tar.gz" -C "$tmp" \
  && "$tmp/$nvim/bin/nvim" --version >/dev/null; then
  rm -rf "$nvim_root/$nvim"
  mv "$tmp/$nvim" "$nvim_root/$nvim"
  rm -rf "$tmp"
else
  rm -rf "$tmp"
  eecho "  Failed to install nvim. Keeping the current version."
  return 1
fi
ln -sf "$nvim_root/$nvim/bin/nvim" "$HOME/.local/bin/nvim"

link_file "$dotfiles_root/nvim/lua" "$HOME/.config/nvim/lua"
link_file "$dotfiles_root/nvim/init.lua" "$HOME/.config/nvim/init.lua"
