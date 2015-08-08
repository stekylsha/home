GRADLE_HOME="${HOME}/bin/gradle"
if [[ ! ( ${PATH} =~ 'gradle' ) && -d "${GRADLE_HOME}" ]]; then
	export PATH=${GRADLE_HOME}/bin:${PATH}
	export GRADLE_HOME
fi
