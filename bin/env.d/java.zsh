if [[ -z "${JDK_HOME}" ]] || [[ ! -e "${JDK_HOME}" ]]; then
    if [[ -x /usr/libexec/java_home ]]; then
        JDK6_HOME=$( /usr/libexec/java_home --version 1.6 --failfast )
        JDK7_HOME=$( /usr/libexec/java_home --version 1.7 --failfast )
        JDK8_HOME=$( /usr/libexec/java_home --version 1.8 --failfast )
        JDK9_HOME=$( /usr/libexec/java_home --version 1.9 --failfast )
        JDK_HOME=${JDK8_HOME}
    else
		export JDK7_HOME=/usr/lib/jvm/java-7-oracle
		export JDK8_HOME=/usr/lib/jvm/java-8-oracle
        JDK_HOME=$( update-alternatives --query javac | grep '^Value' | sed -E 's#^.* (.+)/[^/]+/[^/]+$#\1#' )
    fi
fi
JAVA_HOME=${JDK_HOME}
if [[ ! ( ${PATH} =~ ${JAVA_HOME} ) ]]; then
    PATH=${JAVA_HOME}/bin:${PATH}

    export JDK_HOME JAVA_HOME PATH
fi
