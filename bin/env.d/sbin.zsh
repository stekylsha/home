# Set up the path and library path for sbin
if [[ ! ( ${PATH} =~ 'sbin' ) ]]; then
	PATH=$PATH:/sbin:/usr/sbin
	export PATH
fi
