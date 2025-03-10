function injae_preexec {
  cmd_start="$EPOCHREALTIME"
}

function injae_precmd {
  if [[ $cmd_start ]]; then
    cmd_end="$EPOCHREALTIME"
    printf "Elapsed %.3f seconds\n" $((cmd_end-cmd_start))
    unset cmd_start
  fi
}

autoload -U add-zsh-hook
add-zsh-hook preexec injae_preexec
add-zsh-hook precmd injae_precmd

PROMPT='%{$fg[green]%}%B%m%b%{$reset_color%}:'
PROMPT+='%{$fg[blue]%}%B%~%b%{$reset_color%}'
PROMPT+='$(git_prompt_info)'
PROMPT+='%(?..%{$fg[red]%})%(!.#.$)%{$reset_color%} '
RPROMPT='%(?..%{$fg[red]%}$? ←%{$reset_color%})'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
