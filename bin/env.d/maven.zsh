if [[ ! ( ${PATH} =~ 'maven' ) ]]; then
    M2_HOME=${HOME}/bin/maven
	export PATH=${M2_HOME}/bin:${PATH}
	export M2_HOME
fi
