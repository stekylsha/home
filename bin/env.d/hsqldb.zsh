HSQLDB_HOME=${HOME}/bin/hsqldb
if [[ ! ( ${PATH} =~ 'hsqldb' ) && -d "${HSQLDB_HOME}" ]]; then
	export PATH=${HSQLDB_HOME}/bin:${PATH}
	export HSQLDB_HOME
fi
