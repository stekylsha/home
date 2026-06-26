#!/usr/bin/env zsh

#
# Unalias all the things omz thinks are cool, but aren't.
unalias -- '...'
unalias -- '....'
unalias -- '.....'
unalias -- '......'
unalias -- 1
unalias -- 2
unalias -- 3
unalias -- 4
unalias -- 5
unalias -- 6
unalias -- 7
unalias -- 8
unalias -- 9


alias ll='command ls -laFGv'
alias la='command ls -aCFGv'
alias ls='command ls -CFG'

alias -- '+'='pushd'
alias -- '+1'='pushd +1'
alias -- '+2'='pushd +2'
alias -- '+3'='pushd +3'
alias -- '-'='popd'
alias -- '-1'='popd +1'
alias -- '-2'='popd +2'
alias -- '-3'='popd +3'

alias -- '++'='dirs -pv && echo -n "Which directory? " && read -k d && echo && pushd +${d} && unset d'
alias -- '--'='dirs -pv && echo -n "Which directory? " && read -k d && echo && popd +${d} && unset d'

alias h='fc -l 0'

alias vi='vim'

#alias which-command=whence
#alias xterm='xterm -fn 9x15 -geometry 132x46'
