# Set up the path and library path for ~/bin
if [[ ! ( ( ${PATH} =~ ":${HOME}/bin:*\$" ) || ( ${PATH} =~ "^${HOME}/bin:" ) ) ]]; then
	PATH=${HOME}/bin:${PATH}
	export PATH
fi
