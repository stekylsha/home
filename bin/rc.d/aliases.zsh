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

alias vi='vim'

alias which-command=whence
alias xterm='xterm -fn 9x15 -geometry 128x40'

function chjdk () {
    if $( functions __sdkman_build_version_csv >& /dev/null ); then
        JVS=( $( __sdkman_build_version_csv java | tr ',' ' ' ) )
        typeset -A JH
        for j in ${JVS[@]}; do
            JH[${j%%\.[0-9]*}]=${j}
        done
        sdk use java ${JH[${1}]}
    else
        JH="${:-JDK${1}_HOME}"
        if [[ -d "${(P)${JH}}" ]]; then
            export JDK_HOME="${(P)${JH}}"
            export PATH=$( echo $PATH | sed "s#${JAVA_HOME}#${JDK_HOME}#" )
            export JAVA_HOME=${JDK_HOME}
        else
            echo "No JDK found for ${1}."
        fi
        unset JH
    fi
}

# TODO rewrite this as a function that uses assoc array
function f+g () {
    find ${@:1: -1} -type f -exec egrep -l ${@: -1} {} \;
}

function f+ig () {
    find ${@:1: -1} -type f -exec egrep -il ${@: -1} {} \;
}

function fp+g () {
    find ${@:1: -2} -type f -name ${@: -2: -1} -exec egrep -l ${@: -1} {} \;

}

function fp+ig () {
    find ${@:1: -2} -type f -name ${@: -2: -1} -exec egrep -il ${@: -1} {} \;
}

function fj+g () {
    fp+g ${@:1: -1} \*.java ${@: -1}

}

function fj+ig () {
    fp+ig ${@:1: -1} \*.java ${@: -1}
}

# TODO Have this print a list to choose from
function h+g() {
    local gs
    while [[ ${#} > 0 ]]; do
        gs+="${@[1]}"
        shift
        if [[ ${#} > 0 ]]; then
            gs+=".*"
        fi
    done
    fc -l 0 | egrep "${gs}"
}
