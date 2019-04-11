#!/bin/zsh

function killAgents() {
    pkill -U ${USER} ssh-agent
}

function createAgent() {
    rm -f ${HOME}/.SSH_AGENT
    ssh-agent -s | grep -v 'Agent pid' > ${HOME}/.SSH_AGENT
    . ${HOME}/.SSH_AGENT
}

SSH_AGENT_PID=0

if [ -e ${HOME}/.SSH_AGENT ]; then
    . ${HOME}/.SSH_AGENT
fi

P_SSH_AGENT_PID=( $( pgrep -U ${USER} ssh-agent ) )

if [[ ${#P_SSH_AGENT_PID} -gt 1 ]]; then

    # Too many agents.  Kill 'em all and start again.
    killAgents
    createAgent

elif [[ ${#P_SSH_AGENT_PID} -eq 0 ]]; then

    # None.  Create one.
    createAgent

elif ( [[ ${#P_SSH_AGENT_PID} -eq 1 ]] && [[ ${P_SSH_AGENT_PID[1]} -ne ${SSH_AGENT_PID} ]] ); then

    # Exactly one and it doesn't match our file.
    # Get the socket of the agent.  This is either in /tmp/ssh-* or (MacOS) it
    # needs to be retrieved from lsof.
    P_SSH_AUTH_SOCK=$( /bin/ls -1d /tmp/ssh-*/* )
    if [[ -z "${P_SSH_AUTH_SOCK}" ]]; then
        # try lsof
        P_SSH_AUTH_SOCK=$( lsof -a -U -p ${P_SSH_AGENT_PID[1]} | head -n 2 | tail -n 1 | sed 's#^[^/]*##' )
    fi

    # Still empty?  Error.
    if [[ -z "${P_SSH_AUTH_SOCK}" ]]; then
        exit 0
    fi

    # Remove the old file, create it again with the proper values, source it.
    rm -f ${HOME}/.SSH_AGENT

    echo "SSH_AUTH_SOCK=${P_SSH_AUTH_SOCK}; export SSH_AUTH_SOCK;" > ${HOME}/.SSH_AGENT
    echo "SSH_AGENT_PID=${P_SSH_AGENT_PID[1]}; export SSH_AGENT_PID;" >> ${HOME}/.SSH_AGENT

    . ${HOME}/.SSH_AGENT

fi

# Add identities if they don't already exist
ssh-add -l >& /dev/null
if [[ $? -eq 1 ]]; then
    for f in ${HOME}/.ssh/id_rsa*; do
        ssh-add ${f}
    done
fi
