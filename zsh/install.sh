if ! command -v zsh >/dev/null; then
  eecho "  zsh is not installed. Skipping."
  return 1
fi

omz="$HOME/.oh-my-zsh"

if [ ! -d "$omz" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm "$HOME/.zshrc"
fi

link_file "$dotfiles_root/zsh/zshrc" "$HOME/.zshrc"
link_file "$dotfiles_root/zsh/injae.zsh-theme" "$omz/custom/themes/injae.zsh-theme"

if [ ! -d "$omz/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      "$omz/custom/plugins/zsh-syntax-highlighting"
fi
