eval "$(ssh-agent -s)"
for f in ${HOME}/.ssh/id_rsa*; do
    ssh-add ${f}
done
