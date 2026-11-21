if [[ "$OSTYPE" == darwin* ]]; then
  nvim="nvim-macos-arm64"
else
  nvim="nvim-linux-x86_64"
fi

nvim_root="$HOME/.local/opt"
mkdir -p "$nvim_root" "$HOME/.local/bin"

(
cd "$nvim_root" || exit 1
rm -r "$nvim"
wget "https://github.com/neovim/neovim/releases/download/stable/$nvim.tar.gz"
tar -xf "$nvim.tar.gz"
rm "$nvim.tar.gz"
)
ln -sf "$nvim_root/$nvim/bin/nvim" "$HOME/.local/bin/nvim"

mkdir -p "$HOME/.config/nvim"
link_file "$dotfiles_root/nvim/lua" "$HOME/.config/nvim/lua"
link_file "$dotfiles_root/nvim/init.lua" "$HOME/.config/nvim/init.lua"
