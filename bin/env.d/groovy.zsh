if [[ ! ( ${PATH} =~ 'groovy' ) ]]; then
    GROOVY_HOME=${HOME}/bin/groovy
	export PATH=${GROOVY_HOME}/bin:${PATH}
	export GROOVY_HOME
fi
