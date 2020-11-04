PROMPT='%{$fg[green]%}%D{[%H:%M:%S]}%{$reset_color%} '
PROMPT+='%B%n%b:%{$fg[blue]%}%B%1~%b%{$reset_color%} '
PROMPT+='$(git_prompt_info)'
PROMPT+='%(?..%{$fg[red]%})%(!.#.$)%{$reset_color%} '
RPROMPT='%(?..%{$fg[red]%}$?%{$reset_color%})'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
