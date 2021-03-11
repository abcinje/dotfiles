link_file $dotfiles_root/zsh/zshrc $HOME/.zshrc

if [ -d $HOME/.oh-my-zsh ]; then
  link_file $dotfiles_root/zsh/injae.zsh-theme $HOME/.oh-my-zsh/custom/themes/injae.zsh-theme
fi
