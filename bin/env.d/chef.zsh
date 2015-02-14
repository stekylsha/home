CHEF_HOME=/opt/chef
if [[ ! ( ${PATH} =~ 'chef' ) && -d ${CHEF_HOME} ]]; then
	PATH=${CHEF_HOME}/bin:${CHEF_HOME}/embedded/bin:${PATH}
	export CHEF_HOME PATH
fi
