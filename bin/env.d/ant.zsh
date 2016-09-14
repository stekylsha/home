ANT_HOME="${HOME}/bin/ant"
if [[ ! ( ${PATH} =~ '/ant/' ) && -d "${ANT_HOME}" ]]; then
	export PATH=${ANT_HOME}/bin:${PATH}
	export ANT_HOME
fi
JVMINOR=$( java -fullversion |& sed 's#^[^0-9]*[0-9]*.\([0-9]*\).*$#\1#' )
if [[ ${JVMINOR} -le 7 && ! ( "${ANT_OPTS}" =~ "MaxPermSize" ) ]]; then
	ANT_OPTS="-XX:MaxPermSize=1024m ${ANT_OPTS}"
elif [[ ${JVMINOR} -gt 7 && "${ANT_OPTS}" =~ 'MaxPermSize' ]]; then
	ANT_OPTS=$( echo ${ANT_OPTS} | sed -e 's#-XX:MaxPermSize=[^ ]* *##' )
fi
export ANT_OPTS
