#!/bin/zsh
#
# If sdkman is available, use it for changing the jdk.
function chjdk () {
    if $( functions __sdkman_build_version_csv >& /dev/null ); then
        local JVS=( $( __sdkman_build_version_csv java | tr ',' ' ' ) )
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

# If a file named '.kube.config' exists in the directory, use that instead of
# the global kube configs.
function subkube() {
    if [[ -e ./.kube.config && "${KUBECONFIG}" != "${PWD}/.kube.config" ]]; then
        unset KUBECONFIG
        export KUBECONFIG=${PWD}/.kube.config
    fi
}

# Force kubeconfig verification/setting/...
function rekube() {
    unset KUBECONFIG
    if [[ -e ./.kube.config ]]; then
        export KUBECONFIG=${PWD}/.kube.config
    else
        . ${HOME}/bin/env.d/k8s.zsh
    fi
}
