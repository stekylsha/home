if [[ ! "${fpath}" =~ "${HOME}/.zsh/completion" ]]; then
    fpath=( ~/.zsh/completion ${fpath} )
fi

setopt AUTO_CD
setopt PUSHD_IGNORE_DUPS

CDPATH=
export CDPATH

EDITOR=/usr/bin/vim
export EDITOR
