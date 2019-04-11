#ANSIBLE_HOME="${HOME}/bin/ansible"
#if [[ ! ( ${PATH} =~ '/ansible/' ) && -d "${ANSIBLE_HOME}" ]]; then
if [[ -z "${ANSIBLE_HOME}" ]]; then
	#export PATH=${ANSIBLE_HOME}/bin:${PATH}
	#source ${ANSIBLE_HOME}/hacking/env-setup -q
	export ANSIBLE_HOME=/usr/local/opt/ansible/libexec
    export ANSIBLE_INVENTORY=${HOME}/.ansible_hosts
fi
