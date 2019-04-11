#GRADLE_HOME="${HOME}/bin/gradle"
#if [[ ! ( ${PATH} =~ 'gradle' ) && -d "${GRADLE_HOME}" ]]; then
if [[ -z "${GRADLE_HOME}" ]]; then
	#export PATH=${GRADLE_HOME}/bin:${PATH}
	export GRADLE_HOME=/usr/local/opt/gradle/libexec
fi
