JDK6_HOME=`/usr/libexec/java_home --version 1.6 --failfast`
JDK7_HOME=`/usr/libexec/java_home --version 1.7 --failfast`
JDK8_HOME=`/usr/libexec/java_home --version 1.8 --failfast`
JDK_HOME=${JDK8_HOME}
if [[ ! ( ${PATH} =~ '.jdk' ) ]]; then
	JAVA_HOME=${JDK_HOME}
	PATH=${JAVA_HOME}/bin:${PATH}

	export JAVA_HOME PATH
fi
