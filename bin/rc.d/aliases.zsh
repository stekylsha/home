alias ll='ls -laFG'
alias la='ls -aCFG'
alias ls='ls -CFG'

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
alias hg='fc -l 0 | grep'

alias vi='vim'

alias which-command=whence
alias xterm='xterm -fn 9x15 -geometry 128x40'

function f+g () {
    find $1 -type f -exec grep -l $2 {} \;
}

function f+ig () {
    find $1 -type f -exec grep -il $2 {} \;
}
