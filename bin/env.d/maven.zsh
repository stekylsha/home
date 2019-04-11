#M2_HOME=${HOME}/bin/maven
#if [[ ! ( ${PATH} =~ 'maven' ) && -d "${M2_HOME}" ]]; then
#	export PATH=${M2_HOME}/bin:${PATH}
#	export M2_HOME
#fi
if [[ -z "${M2_HOME}" ]]; then
	export M2_HOME=/usr/local/opt/ansible/libexec
fi
