ANT_HOME="${HOME}/bin/ant"
if [[ ! ( ${PATH} =~ '/ant/' ) && -d "${ANT_HOME}" ]]; then
	export PATH=${ANT_HOME}/bin:${PATH}
	export ANT_HOME
fi
