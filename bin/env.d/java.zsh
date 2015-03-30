if [[ -x /usr/libexec/java_home ]]; then
    JDK6_HOME=$( /usr/libexec/java_home --version 1.6 --failfast )
    JDK7_HOME=$( /usr/libexec/java_home --version 1.7 --failfast )
    JDK8_HOME=$( /usr/libexec/java_home --version 1.8 --failfast )
    JDK_HOME=${JDK8_HOME}
	JAVA_HOME=${JDK_HOME}
else
    JDK_HOME=$( update-alternatives --query javac | grep '^Value' | sed -E 's#^.* (.+)/[^/]+/[^/]+$#\1#' )
    JAVA_HOME=${JDK_HOME}
fi
if [[ ! ( ${PATH} =~ ${JAVA_HOME} ) ]]; then
	PATH=${JAVA_HOME}/bin:${PATH}

	export JDK_HOME JAVA_HOME PATH
fi
