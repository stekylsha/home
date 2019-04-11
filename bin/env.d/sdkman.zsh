if [[ -z "${SDKMAN_DIR}" ]]; then
    SDKMAN_DIR=${HOME}/.sdkman
    if [[ ! ( ${PATH} =~ 'sdkman' ) && -d "${SDKMAN_DIR}" ]]; then
        export SDKMAN_DIR
        [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
    fi
fi
