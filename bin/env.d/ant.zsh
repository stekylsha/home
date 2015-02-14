#if ! echo $PATH | /usr/bin/egrep -q "apache-ant" ; then
#	ANT_HOME=$HOME/bin/apache-ant-1.8.1
#	PATH=$PATH:$ANT_HOME/bin
#
#	ANT_ARGS=
#	CLASSPATH="."
#	#foreach jar in $HOME/bin/ht3/lib/*.jar; do
#	#	CLASSPATH=$CLASSPATH:$jar
#	#done
#	export ANT_ARGS CLASSPATH
#
#	export ANT_HOME PATH
#fi
