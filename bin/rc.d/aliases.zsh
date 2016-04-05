alias ll='ls -laFGv'
alias la='ls -aCFGv'
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
alias h+g='fc -l 0 | egrep'

alias vi='vim'

alias which-command=whence
alias xterm='xterm -fn 9x15 -geometry 128x40'

chjdk () {
    export JDK_HOME=$( /usr/libexec/java_home --version 1.${1} --failfast )
    export PATH=$( echo $PATH | sed "s#${JAVA_HOME}#${JDK_HOME}#" )
    export JAVA_HOME=${JDK_HOME}
}

function f+g () {
    find ${@:1: -1} -type f -exec egrep -l ${@: -1} {} \;
}

function f+ig () {
    find ${@:1: -1} -type f -exec egrep -il ${@: -1} {} \;
}

function fj+g () {
    find ${@:1: -1} -type f -name \*.java -exec egrep -l ${@: -1} {} \;

}

function fj+ig () {
    find ${@:1: -1} -type f -name \*.java -exec egrep -il ${@: -1} {} \;
}

function fp+g () {
    find ${@:1: -2} -type f -name ${@: -2: -1} -exec egrep -l ${@: -1} {} \;

}

function fp+ig () {
    find ${@:1: -2} -type f -name ${@: -2: -1} -exec egrep -il ${@: -1} {} \;
}
