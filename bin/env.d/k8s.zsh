#!/bin/zsh
if [[ -d ~/.kube && -z "${KUBECONFIG}" ]]; then
    setopt nullglob
    for cfg in ~/.kube/config.*; do
        if [[ -n "${KUBECONFIG}" ]]; then
            KUBECONFIG+=":"
        fi
        KUBECONFIG+="${cfg}"
    done
    export KUBECONFIG
    unsetopt nullglob
fi

