# Set up the path and library path for ~/bin
if [[ ! ( ( ${PATH} =~ ":${HOME}/bin:*\$" ) || ( ${PATH} =~ "^${HOME}/bin:" ) ) ]]; then
	PATH=${PATH}:${HOME}/bin
	export PATH
fi
