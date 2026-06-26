#!/usr/bin/env zsh

# TODO rewrite this as a function that uses assoc array.  one function instead
# of n (6 and counting).
function __f+g__ () {
    local pattern=${@: -1}
    local insensitive
    if [[ ${@: -2: -1} == "yes" ]]; then
        insensitive="i"
    fi
    local match=()
    if [[ ${@: -3: -2} != "nomatch" ]]; then
        match=( -name ${@: -3: -2} )
    fi
    local paths=( ${@:1: -3} )
    if [[ ${#paths} -eq 0 ]]; then
        paths=( . )
    fi
    find ${paths[@]} -type f ${match} -exec egrep -${insensitive}l ${pattern} {} \;
}


function f+g () {
    #__f+g__ \*.xml yes release
    __f+g__ ${@:1: -1} nomatch no ${@: -1}
}

function f+ig () {
    __f+g__ ${@:1: -1} nomatch yes ${@: -1}
}

function fp+g () {
    __f+g__ ${@:1: -2} ${@: -2: -1} no ${@: -1}
}

function fp+ig () {
    __f+g__ ${@:1: -2} ${@: -2: -1} yes ${@: -1}
}

function fj+g () {
    __f+g__ ${@:1: -1} \*.java no ${@: -1}

}

function fj+ig () {
    __f+g__ ${@:1: -1} \*.java yes ${@: -1}
}

# TODO Have this print a list to choose from
function h+g () {
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

function decodeJWT() {
    local at="$( cat ${1} | cut -d '.' -f 2 | tr -d '\n' )"
    local pad=$(( 4 - ( $( echo -n ${at} | wc -c ) % 4 ) ))
    [[ ${pad} -ne 4 ]] && at="${at}$( jot -b = -s '' -n ${pad} )"
    echo -n ${at} | base64 -d | jq --sort-keys .
}
