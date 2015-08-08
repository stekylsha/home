JRUBY_HOME=${HOME}/bin/jruby
if [[ ! ( ${PATH} =~ 'jruby' ) && -d "${JRUBY_HOME}" ]]; then
	export PATH=${JRUBY_HOME}/bin:${PATH}
	export JRUBY_HOME
fi
