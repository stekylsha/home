#eval "$(ssh-agent -s)"
if [ -z "`ssh-add -l`" ]; then
    for f in ${HOME}/.ssh/id_rsa*; do
        ssh-add ${f}
    done
fi
