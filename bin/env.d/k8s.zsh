#!/bin/zsh
if [[ -d ~/.kube && -z "${KUBECONFIG}" ]]; then
    for cfg in ~/.kube/config.*; do
        if [[ -n "${KUBECONFIG}" ]]; then
            KUBECONFIG+=":"
        fi
        KUBECONFIG+="${cfg}"
    done
    export KUBECONFIG
fi

