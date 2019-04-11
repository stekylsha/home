#ANT_HOME="${HOME}/bin/ant"
#if [[ ! ( ${PATH} =~ '/ant/' ) && -d "${ANT_HOME}" ]]; then
#	export PATH=${ANT_HOME}/bin:${PATH}
#	export ANT_HOME
#fi
#JV=( ${(@)$( java -fullversion |& sed -E 's#^[^"]+"([^"]+)".*$#\1#;s#^([[:digit:]]+)\.([[:digit:]]+).*$#\1 \2#' )} )
#JFAMILY=$(( ${JV[1]}-1?${JV[1]}:${JV[2]} ))
#if [[ ${JFAMILY} -le 7 && ! ( "${ANT_OPTS}" =~ "MaxPermSize" ) ]]; then
#	ANT_OPTS="-XX:MaxPermSize=1024m ${ANT_OPTS}"
#elif [[ ${JFAMILY} -gt 7 && "${ANT_OPTS}" =~ 'MaxPermSize' ]]; then
#	ANT_OPTS=$( echo ${ANT_OPTS} | sed -e 's#-XX:MaxPermSize=[^ ]* *##' )
#fi
#export ANT_OPTS
