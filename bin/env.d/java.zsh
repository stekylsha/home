# Deprecated for sdkman
#
#if [[ -z "${JDK_HOME}" ]] || [[ ! -e "${JDK_HOME}" ]]; then
#    if [[ -x /usr/libexec/java_home ]]; then
#        JDK7_HOME=$( /usr/libexec/java_home --version 1.7 --failfast )
#        JDK8_HOME=$( /usr/libexec/java_home --version 1.8 --failfast )
#        #JDK9_HOME=$( /usr/libexec/java_home --version 9 --failfast )
#        JDK10_HOME=$( /usr/libexec/java_home --version 10 --failfast )
#        JDK11_HOME=$( /usr/libexec/java_home --version 11 --failfast )
#        JDK11ao_HOME=$( /usr/libexec/java_home --version ao-11 --failfast )
#        JDK_HOME=${JDK11ao_HOME}
#    else
#		if [[ -d /usr/lib/jvm/java-7-oracle ]]; then
#			export JDK7_HOME=/usr/lib/jvm/java-7-oracle
#		fi
#		if [[ -d /usr/lib/jvm/java-8-oracle ]]; then
#			export JDK8_HOME=/usr/lib/jvm/java-8-oracle
#		fi
#		if [[ -d ${HOME}/bin/openjdk9 ]]; then
#			export JDK9_HOME=${HOME}/bin/openjdk9
#		fi
#		if [[ -d ${HOME}/bin/openjdk10 ]]; then
#			export JDK10_HOME=${HOME}/bin/openjdk10
#		fi
#        #JDK_HOME=$( update-alternatives --query javac | grep '^Value' | sed -E 's#^.* (.+)/[^/]+/[^/]+$#\1#' )
#        JDK_HOME=${JDK11_HOME}
#    fi
#fi
#JAVA_HOME=${JDK_HOME}
#if [[ ! ( ${PATH} =~ ${JAVA_HOME} ) ]]; then
#    PATH=${JAVA_HOME}/bin:${PATH}
#
#    export JDK_HOME JAVA_HOME PATH
#fi
