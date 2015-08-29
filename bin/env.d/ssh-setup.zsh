#if [ -e ${HOME}/.SSH_AGENT ]; then
#    . ${HOME}/.SSH_AGENT
#fi    
#P_SSH_AGENT_PID="$( pgrep -U ${USER} ssh-agent )"
#if [ -z "${P_SSH_AGENT_PID}" ] || [ "${P_SSH_AGENT_PID}" != "${SSH_AGENT_PID}" ]; then
#    rm -f ${HOME}/.SSH_AGENT
#    ssh-agent -s | grep -v 'Agent pid' > ${HOME}/.SSH_AGENT
#    . ${HOME}/.SSH_AGENT
#fi
SSH_IDENTITIES="$( ssh-add -l )"
if [ $? -ne 0 ] || [ -z "${SSH_IDENTITIES}" ]; then
    for f in ${HOME}/.ssh/id_rsa*; do
        ssh-add ${f}
    done
fi
