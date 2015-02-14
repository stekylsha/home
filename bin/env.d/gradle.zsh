if [[ ! ( ${PATH} =~ 'gradle' ) ]]; then
    GRADLE_HOME=${HOME}/bin/gradle
	export PATH=${GRADLE_HOME}/bin:${PATH}
	export GRADLE_HOME
fi
