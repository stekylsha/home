SDKMAN_DIR=${HOME}/.sdkman
if [[ ! ( ${PATH} =~ 'sdkman' ) && -d "${SDKMAN_DIR}" ]]; then
	export SDKMAN_DIR
	[[ -s "/home/ss186187/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ss186187/.sdkman/bin/sdkman-init.sh"
fi
