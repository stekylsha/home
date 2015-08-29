GROOVY_HOME=${HOME}/bin/groovy
if [[ ! ( ${PATH} =~ 'groovy' ) && -d "${GROOVY_HOME}" ]]; then
	export PATH=${GROOVY_HOME}/bin:${PATH}
	export GROOVY_HOME
fi
