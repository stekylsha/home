#PROMPT='[%{$fg_bold[red]%}%m%{$reset_color%}] %{$fg[magenta]%}%!%{$reset_color%}%(?,%{$fg[green]%},%{$fg[red]%})%#%{$reset_color%} '
PROMPT='[%{$fg_bold[red]%}%m%{$reset_color%}] %{$fg[magenta]%}%!%{$reset_color%}%(?,%{$fg[green]%},%{$fg[red]%})%# '
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
#RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg_bold[blue]%}%m%{$reset_color%}'
RPS1='%{$fg[white]%}%2~$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"
