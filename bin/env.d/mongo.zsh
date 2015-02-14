if [[ ! ( ${PATH} =~ 'mongodb' ) ]]; then
	MONGO_HOME=$HOME/bin/mongodb-osx-x86_64-2.6.3
	PATH=$MONGO_HOME/bin:$PATH

	export MONGO_HOME PATH
fi
